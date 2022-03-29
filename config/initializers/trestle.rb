require 'trestle/active_storage/field'

Trestle.configure do |config|
    config.hook(:javascripts) do
    javascript_include_tag('activestorage') +
    javascript_include_tag('trestle/active_storage_fields.js')
  end

  config.form_field :active_storage_field, Trestle::ActiveStorage::Field
end
