Rails.application.routes.draw do
  post '/login', to: 'users#login'
  get '/map', to: 'monuments#map'
  get '/about', to: 'monuments#about'
  get '/blogs', to: 'travelogues#blogs'
  resources :monuments
  resources :mon_travels
  resources :favorites
  resources :travelogues
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
