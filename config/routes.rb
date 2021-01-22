Rails.application.routes.draw do

  root to: 'tags#index'

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'    
  end

  namespace :admins do
    resources :tags
    resources :recipes do
      resources :foodstuffs
      resources :recipephotos
    end
    resources :users
  end

  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   passwords: 'users/passwords'
  # }

  resources :users do
    member do
      get 'nonreleases'
    end
  end

  resources :tags 

  resources :recipes do
    resources :foodstuffs
    resources :recipephotos
    member do
      get 'recipe_detail'
      get 'nonreleases'
      patch 'nonrelease'
      patch 'release'
    end
    collection do
      get 'search'
    end
  end

end
