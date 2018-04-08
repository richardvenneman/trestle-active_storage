module Trestle
  module ActiveStorage
    class Field < Trestle::Form::Field
      def field
        instance = builder.object
        attachment = instance.send(name)

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
