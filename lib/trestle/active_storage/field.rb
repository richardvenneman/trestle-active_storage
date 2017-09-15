module Trestle
  module ActiveStorage
    class Field < Trestle::Form::Field
      include AttachmentHelper

      def field
        instance = builder.object
        attachment = instance.send(name)

        add_attachment_field(name)
        instance.class.send(:attr_accessor, "delete_#{name}")
        @template.render partial: 'trestle/active_storage/field',
                         locals: {
                           builder: builder,
                           field_name: name,
                           attachment: attachment
                         }
      end
    end
  end
end
