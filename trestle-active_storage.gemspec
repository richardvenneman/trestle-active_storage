$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'trestle/active_storage/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'trestle-active_storage'
  s.version     = Trestle::ActiveStorage::VERSION
  s.authors     = ['Richard Venneman']
  s.email       = ['richardvenneman@me.com']
  s.homepage    = 'https://github.com/richardvenneman/trestle-active_storage'
  s.summary     = 'ActiveStorage integration plugin for the Trestle admin framework'
  s.description = 'ActiveStorage integration plugin for the Trestle admin framework.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.require_paths = ['lib']

  s.add_dependency 'rails', '>= 5.2', '< 8'
  s.add_dependency "trestle", "~> 0.9.0", ">= 0.9.3"
end
