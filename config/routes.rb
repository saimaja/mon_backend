Rails.application.routes.draw do
  post '/login', to: 'users#login'
  
  resources :monuments
  resources :mon_travels
  resources :favorites
  resources :travelogues
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
