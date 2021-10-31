Rails.application.routes.draw do
  devise_for :users
  resources :items do
    collection do
      get 'search'
    end
    resources :purchases, only: [:index,:create] do
    end
  end 
  root to: 'items#index'
end
