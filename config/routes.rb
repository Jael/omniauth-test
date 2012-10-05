Omniauth::Application.routes.draw do
  match "/auth/:provider/callback", :to => "sessions#create"
  root :to => "users#new"
  get "logout" => "sessions#destroy", :as => "log_out"
  get "login" => "sessions#new", :as => "log_in"
  resources :users do
    resources :posts do
      resources :comments
    end
  end
  get 'tags/:tag', to: 'posts#index', as: :tag 
  resources :user_steps
  resources :sessions

end
