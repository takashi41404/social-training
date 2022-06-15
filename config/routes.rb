Rails.application.routes.draw do
  #管理者ログイン用
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  #会員サインアップ＆ログイン
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
  end

end
