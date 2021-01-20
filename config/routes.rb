Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'tags#index'
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
  resources :tags 
  resources :users do
  member do
    get 'nonreleases'
  end
end
end
