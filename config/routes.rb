Rails.application.routes.draw do
  devise_for :users
  root to: 'tags#index'
  resources :recipes do
    resources :foodstuffs
    resources :recipephotos
    member do
      get 'recipe_detail'
      patch 'nonrelease'
      patch 'release'
    end
  end
  resources :tags
  resources :users
end
