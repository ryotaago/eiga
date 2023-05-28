Rails.application.routes.draw do

  namespace :user do
    get 'users/show'
  end
  devise_for :admins, controllers: {
  registrations: "admins/registrations",
  sessions: "admins/sessions",
  passwords: "admins/passwords"
  }

  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions",
  passwords: "users/passwords"
  }

  devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#new_guest'
end

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :movies, only:[:index, :show, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy]
  end

  scope module: :user do
    root to: 'homes#top'
    get "/about" =>"homes#about"
    resources :movies, only: [:index, :show] do
      resources :reviews, only: [:create, :destroy] do
        resources :users, only: [:show]
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

