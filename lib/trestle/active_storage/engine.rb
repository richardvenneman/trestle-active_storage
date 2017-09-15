module Trestle
  module ActiveStorage
    class Engine < Rails::Engine
      config.assets.precompile << 'activestorage.js' << 'trestle/active_storage_fields.js'
    end
  end
end
