Rails.application.routes.draw do
  devise_for :users
  root to: 'tags#index'
  resources :recipes do
    resources :foodstuffs
    resources :recipephotos
  end
  resources :tags
  resources :users
end
