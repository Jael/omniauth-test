Omniauth::Application.routes.draw do
  match "/auth/:provider/callback", :to => "sessions#create"
  root :to => "users#new"
  get "logout" => "sessions#destroy", :as => "log_out"
  get "login" => "sessions#new", :as => "log_in"
  resources :users
  resources :posts
  resources :user_steps
  resources :sessions

end
