Rails.application.routes.draw do

  get 'tag/search'
  root to: 'user/homes#top'
    get "/role" => "user/homes#role"

  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    post "users/guest_sign_in", to: "user/sessions#guest_sign_in"
  end

  scope module: :user do
    get "search_tag" => "notes#search_tag"
    get "search" => "searches#search"
  end

  scope module: :user do
    resources :records, only: [:new, :create, :update, :destroy] do
     resource :record_favorites, only: [:create, :destroy]
    end
  end

  scope module: :user do
    resources :notes do
      resource :note_favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  scope module: :user do
    get 'users/quit' => "users#quit"
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:show, :edit, :update] do
      member do
        get :follows, :followers
      end
        resource :relationships, only: [:create, :destroy]
    end
  end

  scope module: :user do
    resources :reports, only: [:new, :create, :show, :edit]
  end


  
   get "/admin" => "admin/homes#top"  
   
  namespace :admin do
    get "search" => "searches#index"
  end
  
  namespace :admin do
    resources :records, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :notes, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :comments, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :reports, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end


end
