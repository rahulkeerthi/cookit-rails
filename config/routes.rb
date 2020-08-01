Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :restaurants
  resources :kits do
    member do
      get 'related_by_tag'
      get 'related_by_restaurant'
    end
  end

end
