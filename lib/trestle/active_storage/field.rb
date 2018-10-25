module Trestle
  module ActiveStorage
    class Field < Trestle::Form::Field
      def field
        instance = builder.object
        attachment = instance.send(name)

        rendering_options = {}.tap do |hash|
          hash[:locals] = {}.tap do |locals|
            locals[:builder] = builder
            locals[:field_name] = name

            if attachment.respond_to?(:each)
              hash[:partial] = 'trestle/active_storage/has_many_field'
              locals[:attachments] = attachment
            else
              hash[:partial] = 'trestle/active_storage/has_one_field'
              locals[:attachment] = attachment
            end
          end
        end

        @template.render rendering_options
      end
    end
  end
end
