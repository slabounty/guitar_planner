Rails.application.routes.draw do
  get "planners/new"
  get "planners/create"
  resource :session
  resources :passwords, param: :token
  root "pages#landing"

  get "pages/landing"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #
  get  "signup", to: "users#new"
  post "signup", to: "users#create"

  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: [ :new, :create, :show ]
  get "user_home", to: "users#show"

  resources :planners, only: [ :new, :create, :edit, :update, :destroy ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
