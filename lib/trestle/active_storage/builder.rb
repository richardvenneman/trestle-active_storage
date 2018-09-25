module Trestle
  module ActiveStorage
    module Builder
      def active_storage_fields(&block)
        admin.define_adapter_method(:active_storage_fields, &block)
      end
    end
  end
end
