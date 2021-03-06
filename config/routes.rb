Rails.application.routes.draw do

  namespace :dynamic_select do
    get ':category_id/categories', to: 'categories#index', as: 'categories'
  end

  resources :families, only: [:show] do
    resources :members, only: [:new, :create, :destroy]
    resources :tasks do
      resources :comments, only: [:create]
    end
  end

  resources :comments, only: [:create] do
    resources :comments, only: [:create]
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'registrations',
    invitations: 'users/invitations'
  }
  
  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
end
