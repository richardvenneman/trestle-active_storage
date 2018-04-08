module Trestle
  module ActiveStorage
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        before_action :delete_attachment_params, only: [:create, :update]
        after_action :attach_attachments, only: %i[create update]
        after_action :purge_attachments, only: %i[update]
      end

      protected

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
