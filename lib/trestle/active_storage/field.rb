module Trestle
  module ActiveStorage
    class Field < Trestle::Form::Field
      def field
        instance = builder.object
        attachment = instance.send(name)

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
