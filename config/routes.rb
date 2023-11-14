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
    resources :reports, only: [:show, :edit, :destroy]
  end


  
   get "/admin" => "admin/homes#top"  
   
  namespace :admin do
    get 'records/edit'
    get 'records/update'
  end

  namespace :admin do
    get 'comments/edit'
    get 'comments/update'
  end

  namespace :admin do
    get 'notes/edit'
    get 'notes/update'
  end

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end

  namespace :admin do
    get 'reports/index'
    get 'reports/show'
    get 'reports/edit'
    get 'reports/update'
  end


end
