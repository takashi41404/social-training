Rails.application.routes.draw do
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  #管理者ログイン用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #会員サインアップ＆ログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :records
  end

end
