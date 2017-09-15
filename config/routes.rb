Trestle::Engine.routes.draw do
  post '/active_storage/direct_uploads' => 'active_storage/direct_uploads#create', as: :rails_direct_uploads

  controller 'trestle/active_storage/attachments' do
    delete 'active_storage_attachments/:id' => :destroy, as: :active_storage_attachment_admin
  end
end
