module Trestle
  module ActiveStorage
    module AttachmentHelper
      def add_attachment_field(name)
        fields = attachment_fields.concat([name]).uniq
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
