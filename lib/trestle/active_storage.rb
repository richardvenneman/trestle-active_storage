require_relative 'active_storage/version'

require 'trestle'

module Trestle
  module ActiveStorage

    require_relative "active_storage/builder"
    require_relative "active_storage/resource"
    require_relative "active_storage/controller_concern"

  end
end

require_relative 'active_storage/engine' if defined?(Rails)
