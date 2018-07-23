Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create]
  get "/users/:username", to: "users#show", as: "user"
  patch "/users/:username", to: "users#update"
  put "/users/:username", to: "users#update"
  resources :videos, only: [:index, :create, :update, :show]

  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end

end
