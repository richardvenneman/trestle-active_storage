# Trestle Active Storage Integration (trestle-active_storage)

> [Active Storage](https://guides.rubyonrails.org/active_storage_overview.html) integration plugin for the [Trestle admin framework](https://trestle.io)

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

### Active Storage previews

This plugin shows previews of uploaded files if your system meets the requirements. For more information please [consult the Ruby on Rails guides](https://edgeguides.rubyonrails.org/active_storage_overview.html#previewing-files).

If you'd like to get up and running on Heroku, check out their [documentation on Active Storage on Heroku](https://devcenter.heroku.com/articles/active-storage-on-heroku#attachment-previews). The [Ruby on Rails Development Dependencies Install guide](https://edgeguides.rubyonrails.org/development_dependencies_install.html#active-storage-setup) outlines how to install the neccessary dependencies to get previews working locally.

## TODO / Wishlist

- [ ] Support for `has_many_attached` attachments
- [x] Support for Active Storage previews
- [ ] Preview of selected local file ([#1](https://github.com/richardvenneman/trestle-active_storage/issues/1))
- [ ] Integration tests

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
