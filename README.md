# Trestle ActiveStorage Integration (trestle-active_storage)

> [ActiveStorage](https://github.com/rails/rails/tree/master/activestorage#active-storage) integration plugin for the [Trestle admin framework](https://trestle.io)

[![Gem](https://img.shields.io/gem/v/trestle-active_storage.svg)](https://rubygems.org/gems/trestle-active_storage)

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

## Wishlist

- [ ] Support for `has_many_attached` attachments
- [ ] Support for [ActiveStorage previews](https://api.rubyonrails.org/v5.2/classes/ActiveStorage/Previewer.html)
- [ ] Integration tests

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
