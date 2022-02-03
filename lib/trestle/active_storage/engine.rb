module Trestle
  module ActiveStorage
    class Engine < Rails::Engine
      config.assets.precompile << 'activestorage.js' << 'trestle/active_storage_fields.js'
      config.action_controller.per_form_csrf_tokens = true
      config.to_prepare do
        Trestle::ResourceController.send(:include, Trestle::ActiveStorage::ControllerConcern)
      end

      initializer :extensions do
        Trestle::Resource.send(:include, Trestle::ActiveStorage::Resource)
        Trestle::Resource::Builder.send(:include, Trestle::ActiveStorage::Builder)
      end
    end
  end
end
