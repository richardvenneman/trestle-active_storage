module Trestle
  module ActiveStorage
    module ControllerConcern
      extend ActiveSupport::Concern
      include AttachmentHelper

      included do
        after_action :delete_attachments, only: %i[update], unless: :trestle_auth_controller?
        after_action :set_attachments, only: %i[create update], unless: :trestle_auth_controller?
      end

      protected

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
          instance.send(field).purge if instance.send("delete_#{field}") == '1'
        end
      end

      def trestle_auth_controller?
        self.class == Trestle::Auth::SessionsController
      end
    end
  end
end
