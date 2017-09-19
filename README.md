# Trestle ActiveStorage Integration (trestle-active_storage)

> [ActiveStorage](https://github.com/rails/rails/tree/master/activestorage) integration plugin for the Trestle admin framework

__NOTE: This plugin is currently in development, this is a pre-release.__

## Getting Started

These instructions assume you have a working Trestle application. To integrate trestle-active_storage, first add it to your application's Gemfile:

```ruby
gem 'trestle-active_storage'
```

Run `bundle install`, and then restart your Rails server.

To add an ActiveStorage file field to your form, use the `active_storage_field` field type:

```ruby
Trestle.resource(:users) do
  form do |user|
    active_storage_field :avatar
  end
end
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
