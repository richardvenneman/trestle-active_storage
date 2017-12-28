module Trestle
  module ActiveStorage
    module Resource
      attr_writer :active_storage_fields

      def active_storage_fields
        instance_exec(&@active_storage_fields)
      end
    end
  end
end
