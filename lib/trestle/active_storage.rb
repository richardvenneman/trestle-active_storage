require 'trestle'
require 'trestle/active_storage/version'
require 'trestle/active_storage/engine' if defined?(Rails)

module Trestle
  module ActiveStorage
    extend ActiveSupport::Autoload

    autoload :Builder
    autoload :ControllerConcern
  end
end
