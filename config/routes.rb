Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :movies, only:[:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :reviews, only: [:index, :show, :edit, :update, :destroy]
    end
    resources :comments, only: [:index, :show, :destroy]
    resources :follows, only: [:index, :show, :destroy]
  end

  scope module: :user do
    root to: 'homes#top'
    get "/about" =>"homes#about"
    resources :movies, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :edit, :update, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
    end
    resources :follows, only: [:create, :destroy]
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

