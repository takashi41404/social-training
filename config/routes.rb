Rails.application.routes.draw do

  #管理者ログイン用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #管理者画面
  namespace :admin do
    resources :users, only: [:show, :index, :edit, :update]
    resources :records, only: [:show, :index, :destroy]

  end


  #会員サインアップ＆ログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 以下、ユーザー用
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'

    resources :records do
      resources :social_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :users, only: [:index,:show,:edit,:update] do
      collection do
       get :unsubscribe , as: 'confirm_unsubscribe'
       patch :withdraw, as: 'withdraw'
      end

      resource :relationships, only: [:create, :destroy]
        get 'followees' => 'relationships#followees', as: 'followees'
        get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

end
