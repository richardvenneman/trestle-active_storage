module Trestle
  module ActiveStorage
    class Engine < Rails::Engine
      config.assets.precompile << 'activestorage.js' << 'trestle/active_storage_fields.js'

      initializer :extensions do
        Trestle::ApplicationController.send(:include, Trestle::ActiveStorage::ControllerConcern)
      end
    end
  end
end
