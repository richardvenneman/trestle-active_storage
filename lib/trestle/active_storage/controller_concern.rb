module Trestle
  module ActiveStorage
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        before_action :define_attachment_accessors, only: [:show, :edit, :update, :destroy]
        before_action :filter_has_many_attachments, only: [:update]
        after_action :purge_attachments, only: [:update]
        after_action :attach_attachments, only: [:update]
      end

      private
      def filter_has_many_attachments
        return if admin.active_storage_fields.empty?

        @removed_attachments = Hash.new
        admin.active_storage_fields.each do |field|
          if instance.send(field).respond_to?(:each)
            if params.key?(admin.parameter_name)
              @removed_attachments[field] = params[admin.parameter_name].delete field.to_sym
            end
          end
        end
      end

      def attach_attachments
        return if @removed_attachments.blank?

        @removed_attachments.each do |field, attachments|
          instance.send(field).attach(attachments)
        end
      end

        def define_attachment_accessors
          self.instance = admin.find_instance(params)

          admin.active_storage_fields.each do |field|
            attachment = instance.send(field)

            if attachment.respond_to?(:each)
              attachment.each do |att|
                instance.class.send(:attr_accessor, "delete_#{field}_#{att.blob_id.to_s.gsub('-', '')}")
              end
            else
              instance.class.send(:attr_accessor, "delete_#{field}")
            end
          end
        end

        def purge_attachments
          admin.active_storage_fields.each do |field|
            attachment = instance.send(field)

            if attachment.respond_to?(:each)
              attachment.each do |att|
                att.purge if instance.try("delete_#{field}_#{att.blob_id.to_s.gsub('-', '')}") == '1'
              end
            else
              instance.send(field).purge if instance.try("delete_#{field}") == '1'
            end
          end
        end
    end
  end
end
