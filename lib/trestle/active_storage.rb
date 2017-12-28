require 'trestle/active_storage/version'
require 'trestle'

module Trestle
  module ActiveStorage
    extend ActiveSupport::Autoload

    autoload :Builder
    autoload :ControllerConcern
    autoload :Resource
  end
end

require 'trestle/active_storage/engine' if defined?(Rails)
