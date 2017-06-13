Rails.application.routes.draw do

  # redirect to landing page
  root to: 'flats#index'

  # resources
  resources :flats, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create, :show]
  end

  # example
  # resources :cocktails, only: [:index, :show, :new, :create] do
  #   resources :doses, only: [:new, :create, :destroy]
  # end

  # routes for the user (made automatically by devise)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
