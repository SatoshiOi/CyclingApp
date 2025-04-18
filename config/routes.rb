Rails.application.routes.draw do
  # 🔐 Devise（ユーザー認証）
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "users/sessions"
  }

  # 🌟 トップページ＆ダッシュボード
  root to: "home#index"
  get "home/index"
  get "dashboard", to: "dashboards#show"

  # ✅ ルート（サイクリングコース）
  resources :routes do
    resource :favorite, only: [:create, :destroy]         # いいね機能（単数形で1ユーザー1いいね）
    resources :comments, only: [:create, :destroy]        # コメント機能
    resources :runs, only: [:create]                      # 実際に走った記録を保存
  end

  # 📌 お気に入りルート一覧ページ（/favorites）
  resources :favorites, only: [:index]  # ★これが「favorites_path」生成のカギ！

  # 👤 各ユーザーのお気に入り（/users/:id/favorites）
  resources :users, only: [] do
    member do
      get :favorites
    end
  end

  # 🚲 自転車情報（1人1台だけ所有可）
  resource :bike, only: [:new, :create, :show, :edit, :update, :destroy]  # 単数形！
  resources :bikes, only: [:index]  # 一覧ページ用（全体）

  # 👤 プロフィールページ
  get "profile", to: "profiles#show", as: "profile"

  # PWA関連
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest

  # ヘルスチェック
  get "up", to: "rails/health#show", as: :rails_health_check
end
