Rails.application.routes.draw do
  get "dashboards/show"
  devise_for :users, controllers: { registrations: "registrations" }
  get "home/index"
  root to: "home#index"
  get "dashboard", to: "dashboards#show"
  resources :routes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"


  # ルートに対するお気に入り登録をネストさせる
  resources :routes do
    resource :favorite, only: [ :create, :destroy ]
  end

  resources :users do
    member do
      get :favorites
    end
  end

# 手動で作った ProfilesController に対してルートを定義
resources :profiles, only: [] do
  member do
    get :favorites
  end
end

resources :favorites, only: [ :index ]


resources :routes do
  resources :comments, only: [ :create, :destroy ]
end

resources :routes do
  resources :runs, only: [:create]
end

end
