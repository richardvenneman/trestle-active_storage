# Trestle ActiveStorage Integration (trestle-active_storage)

> [ActiveStorage](https://github.com/rails/rails/tree/master/activestorage) integration plugin for the Trestle admin framework

**NOTE: This plugin is currently in development, this is a pre-release.**

## Usage

Define the active storage fields in your Trestle resource and use the `active_storage_field` field type:

```ruby
Trestle.resource(:users) do
  active_storage_fields do
    [:avatar, :profile_picture]
  end

  form do |user|
    text_field :first_name
    text_field :last_name
    active_storage_field :avatar
    active_storage_field :profile_picture
  end
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
