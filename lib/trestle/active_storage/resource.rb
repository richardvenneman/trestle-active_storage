module Trestle
  module ActiveStorage
    module Resource
      extend ActiveSupport::Concern

      included do
        singleton_class.send(:prepend, Collection)
      end

      module Collection
        def active_storage_fields
          if active_storage_attachable?
            adapter.active_storage_fields
          else
            []
          end
        end
      end

      module ClassMethods
        def active_storage_attachable?
          adapter.respond_to?(:active_storage_fields)
        end
      end
    end
  end
end
