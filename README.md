# Trestle ActiveStorage Integration (trestle-active_storage)

> [ActiveStorage](https://github.com/rails/rails/tree/master/activestorage) integration plugin for the Trestle admin framework

__NOTE: This plugin is currently in development, this is a pre-release.__

## Usage

Using this plugin currently involves 3 steps:

1. Configure the plugin
2. Use the `active_storage_field` field_type
2. Remove the field attribute from Trestle's `update_instance`

### 1. Configure the plugin

Configure this plugin within `config/initializers/trestle.rb`. You'll need to specify a map of models with attributes like so:

```ruby
Trestle.configure do |config|
  config.active_storage.configure do |c|
    c.fields = {
      'User' => [:avatar],
      'Post' => [:header, :thumbnail]
    }
  end
end
```

### 2. Use the `active_storage_field` field_type

To add an ActiveStorage file field to your form, use the `active_storage_field` field type:

```ruby
Trestle.resource(:users) do
  form do |user|
    active_storage_field :avatar
  end
end
```

### 3. Remove attributes

In order to override Trestle's default update mechanism, remove the attachment attributes from your admin configurations:

```ruby
Trestle.resource(:users) do
  update_instance do |instance, params|
    instance.update_attributes(params.except(:avatar))
  end
```

## Installation

These instructions assume you have a working Trestle application. To integrate trestle-active_storage, first add it to your application's Gemfile:

```ruby
gem 'trestle-active_storage'
```

Run `bundle install`, and then restart your Rails server.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
