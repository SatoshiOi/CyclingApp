Rails.application.routes.draw do
  get "bikes/new"
  get "bikes/create"
  get "bikes/show"
  get "bikes/edit"
  get "bikes/update"
  get "dashboards/show"
  devise_for :users, controllers: { registrations: "registrations" }
  get "home/index"
  root to: "home#index"
  get "dashboard", to: "dashboards#show"
  resources :routes




  get "up" => "rails/health#show", as: :rails_health_check


  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest




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

resource :bike, only: [:new, :create, :show, :edit, :update, :destroy]  # 単数形！1ユーザー1台限定！
resources :bikes, only: [:index] # 一覧ページ用
end
