Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  devise_for :users, path: "users", controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :posts do
      resources :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users
    get '/:username/unsubscribe' => 'users#unsubscribe'
    patch '/:username/widthdraw' => 'users#widthdraw', as: "users_widthdraw"
  # 以下のルーティングは常に一番下に
    get '/mypage' => 'users#mypage'
    get '/:username' => 'users#show'
    get '/:username/edit' => 'users#edit'
    patch '/:username' => 'users#update'
  end

end
