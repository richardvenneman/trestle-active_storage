module Trestle
  module ActiveStorage
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        after_action :set_attachments, only: %i[create update]
      end

      protected

      def set_attachments
        instance_params = params[instance] = admin.permitted_params(params)
        fields = Rails.cache.read(:active_storage_fields) || []

        fields.each do |field|
          instance.send(field).attach instance_params[field] if instance_params[field].present?
        end

        Rails.cache.write(:active_storage_fields, [])
      end
    end
  end
end
