Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  get '/about' => 'pages#about'
  root 'pages#home'
  resources :contacts
end
