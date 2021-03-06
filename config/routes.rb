Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :movies, only: [:show] do
    resources :reviews, except: [:index] do
      resources :votes, only: [:new, :create, :update]
      resources :comments, only: [:new, :create, :edit, :update] do

      end
      end
    resources :comments, only: [:new, :create, :edit, :update] do
      resources :comments, only: [:new, :create, :edit, :update]
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :edit, :update] do
    resources :comments, only: [:new, :create, :edit, :update]
  end

  resources :genres, only: [:index, :show]

  resources :reviews, except: [:index] do
    resources :comments, only: [:new, :create, :edit, :update]
  end
  # resources :votes, only: [:new, :create, :update]
  root to: 'welcome#index'
end
