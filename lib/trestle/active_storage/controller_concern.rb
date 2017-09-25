module Trestle
  module ActiveStorage
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        before_action :define_attachment_accessors, except: [:index, :new], if: :trestle_resource_controller?
        after_action :set_attachments, only: %i[create update], if: :trestle_resource_controller?
        after_action :delete_attachments, only: %i[update], if: :trestle_resource_controller?
      end

      protected

      def define_attachment_accessors
        self.instance = admin.find_instance(params)

        attachment_fields.each do |field|
          instance.class.send(:attr_accessor, "delete_#{field}")
        end
      end

      def set_attachments
        instance_params = admin.permitted_params(params)

        attachment_fields.each do |field|
          if instance_params[field].present?
            instance.send(field).attach instance_params[field]
          end
        end
      end

      def delete_attachments
        attachment_fields.each do |field|
          instance.send(field).purge if instance.try("delete_#{field}") == '1'
        end
      end

      def attachment_fields
        Trestle.config.active_storage.fields.try(:[], instance.class.to_s) || []
      end

      def trestle_resource_controller?
        self.class.superclass == Trestle::Resource::Controller
      end
    end
  end
end
