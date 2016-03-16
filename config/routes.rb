Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users do
    resource :profile
  end
  get '/about' => 'pages#about'
  root 'pages#home'
  resources :contacts
end
