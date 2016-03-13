Rails.application.routes.draw do
  get '/about' => 'pages#about'
  root 'pages#home'
  resources :contacts
end
