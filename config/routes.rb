Rails.application.routes.draw do
  resources :users

  get 'index' => 'user#index'
  get 'show' => 'user#show'
  post 'new' => 'user#new'
  # put 'edit' => 'user#edit'
  post 'create' => 'user#create'
  put 'update' => 'user#update'
  delete 'destroy' => 'user#destroy'


  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
