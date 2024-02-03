Rails.application.routes.draw do
  root to: "dashboard#index"
  resources :dashboard do
    post "set_current_team", on: :collection
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check
  resources :teams do
    resources :team_users, only: [:create]
  end
  resources :roles

  # Defines the root path route ("/")
  # root "posts#index"
end
