Rails.application.routes.draw do

  resources :families, only: [:show] do
    resources :members, only: [:new, :create, :destroy]
    resources :tasks
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
