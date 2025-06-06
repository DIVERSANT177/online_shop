Rails.application.routes.draw do
  devise_for :users
  authenticate :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :carts
      resources :orders
      resources :products
      resources :users
      resources :roles

      root to: "carts#index"
    end
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  scope "(:locale)" do
    resources :orders
    resources :line_items
    resources :carts
    get "store/index"
    resources :products
  end
  # get "say/hello"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "store#index"
end
