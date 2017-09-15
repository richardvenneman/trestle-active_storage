Trestle::Engine.routes.draw do
  post '/active_storage/direct_uploads' => 'active_storage/direct_uploads#create', as: :rails_direct_uploads
end
