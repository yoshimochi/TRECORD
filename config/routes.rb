Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

 namespace :admin do
    root to: 'homes#top'
    resources :posts, only: [:show, :edit, :update, :destroy] do
      resources :post_comments, only:[:destroy]
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :events

  end

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

    resources :genres, only: [:index, :show]
    resources :events, only: [:new, :create, :index, :show]

    resources :records, only: [:index, :new, :create, :show, :destroy]
    patch '/update_record' => 'records#update_record'
    delete '/delete_record' => 'records#delete_record'

    resources :set_events, only:[:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :training_records

    resources :users
    get '/:username/unsubscribe' => 'users#unsubscribe'
    patch '/:username/widthdraw' => 'users#widthdraw', as: "users_widthdraw"
    resources :relationships, only: [:create, :destroy]

  # 以下のルーティングは常に一番下に
    get '/mypage' => 'users#mypage'
    get '/:username' => 'users#show'
    get '/:username/edit' => 'users#edit'
    patch '/:username' => 'users#update'
  end
end
