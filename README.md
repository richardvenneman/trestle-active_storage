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

You can use the `active_storage_field` field type for both `has_one_attached` and `has_many_attached` attachments.

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

- [x] Support for `has_many_attached` attachments
- [x] Support for Active Storage previews
- [ ] Preview of selected local file ([#1](https://github.com/richardvenneman/trestle-active_storage/issues/1))
- [ ] Integration tests

## Contributors

Thanks goes out to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<table>
  <tr>
    <td align="center"><a href="https://www.cityspotters.com"><img src="https://avatars1.githubusercontent.com/u/75705?v=4" width="100px;" alt="Richard Venneman"/><br /><sub><b>Richard Venneman</b></sub></a><br /><a href="#ideas-richardvenneman" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/richardvenneman/trestle-active_storage/commits?author=richardvenneman" title="Code">💻</a> <a href="https://github.com/richardvenneman/trestle-active_storage/commits?author=richardvenneman" title="Documentation">📖</a> <a href="#question-richardvenneman" title="Answering Questions">💬</a> <a href="#review-richardvenneman" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="http://aboobacker.in"><img src="https://avatars1.githubusercontent.com/u/3112976?v=4" width="100px;" alt="Aboobacker MK"/><br /><sub><b>Aboobacker MK</b></sub></a><br /><a href="#ideas-tachyons" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="http://euodeiovoce.com.br"><img src="https://avatars2.githubusercontent.com/u/1027961?v=4" width="100px;" alt="Rafael Porto"/><br /><sub><b>Rafael Porto</b></sub></a><br /><a href="https://github.com/richardvenneman/trestle-active_storage/commits?author=PunkMaldito" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/hoenth"><img src="https://avatars2.githubusercontent.com/u/62977?v=4" width="100px;" alt="Tom Hoen"/><br /><sub><b>Tom Hoen</b></sub></a><br /><a href="https://github.com/richardvenneman/trestle-active_storage/issues?q=author%3Ahoenth" title="Bug reports">🐛</a> <a href="https://github.com/richardvenneman/trestle-active_storage/commits?author=hoenth" title="Code">💻</a></td>
  </tr>
</table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
