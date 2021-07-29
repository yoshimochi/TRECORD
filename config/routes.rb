Rails.application.routes.draw do
  devise_for :users, path: "users", controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
end
