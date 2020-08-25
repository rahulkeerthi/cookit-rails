Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get 'new', to: 'pages#new'
  get 'popular', to: 'pages#popular'
  get 'favourites', to: 'pages#favourites'
  get 'about', to: 'pages#about'
  get 'contact-us', to: 'pages#contact'
  post 'contact', to: 'contacts#create'
  get 'tc', to: 'pages#tc'

  resources :restaurants
  resources :kits do
    member do
      get 'related_by_tag'
      get 'related_by_restaurant'
    end
  end
end
