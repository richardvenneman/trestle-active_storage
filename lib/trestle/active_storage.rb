require 'trestle'
require 'trestle/active_storage/version'
require 'trestle/active_storage/configuration'
require 'trestle/active_storage/engine' if defined?(Rails)

Trestle::Configuration.option :active_storage, Trestle::ActiveStorage::Configuration.new

module Trestle
  module ActiveStorage
    extend ActiveSupport::Autoload

    autoload :ControllerConcern
  end
end
