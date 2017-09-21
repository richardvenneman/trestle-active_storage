module Trestle
  module ActiveStorage
    module AttachmentHelper
      def attach_field(instance, field_name)
        instance.class.send(:attr_accessor, "delete_#{field_name}")
        add_attachment_field(field_name)
      end

      def add_attachment_field(field_name)
        fields = attachment_fields.concat([field_name]).uniq
        Rails.cache.write(:active_storage_fields, fields)
      end

      def attachment_fields
        Rails.cache.read(:active_storage_fields) || []
      end

      def reset_attachment_fields
        Rails.cache.write(:active_storage_fields, [])
      end
    end
  end
end
