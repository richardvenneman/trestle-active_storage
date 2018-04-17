module Trestle
  module ActiveStorage
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        before_action :define_attachment_accessors, except: [:index]
        before_action :delete_attachment_params, only: [:create, :update]
        after_action :attach_attachments, only: [:create, :update]
        after_action :purge_attachments, only: [:update]
      end

      protected

      def define_attachment_accessors
        self.instance = admin.find_instance(params)

        admin.active_storage_fields.each do |field|
          instance.class.send(:attr_accessor, "delete_#{field}")
        end
      end

      def delete_attachment_params
        admin.active_storage_fields.each { |field| params.delete(field) }
      end

      def attach_attachments
        instance_params = admin.permitted_params(params)

        admin.active_storage_fields.each do |field|
          if instance_params[field].present?
            instance.send(field).attach instance_params[field]
          end
        end
      end

      def purge_attachments
        admin.active_storage_fields.each do |field|
          instance.send(field).purge if instance.try("delete_#{field}") == '1'
        end
      end
    end
  end
end
