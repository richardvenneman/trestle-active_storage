module Trestle
  module ActiveStorage
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        after_action :set_attachments, only: %i[create update]
        after_action :delete_attachments, only: %i[update]
      end

      protected

      def set_attachments
        instance_params = admin.permitted_params(params)

        attachment_fields.each do |field|
          instance.send(field).attach instance_params[field] if instance_params[field].present?
        end
      end

      def delete_attachments
        attachment_fields.each do |field|
          if instance.send("delete_#{field}") == '1'
            instance.send(field).purge
          end
        end
      end

      def attachment_fields
        Rails.cache.read(:active_storage_fields) || []
      end

      def reset_attachments_cache
        Rails.cache.write(:active_storage_fields, [])
      end
    end
  end
end
