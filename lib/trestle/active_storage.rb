require 'trestle'
require 'trestle/active_storage/version'
require 'trestle/active_storage/engine'

module Trestle
  module ActiveStorage
    extend ActiveSupport::Autoload

    autoload :ControllerConcern
  end
end
