Rails.application.routes.draw do
  devise_for :admins, :only => [:sessions]
  root 'home#index'
  devise_for :users

  get "/product/:slug" => "home#product_details", as: "product_details"
  get "/thank_you" => "home#thank_you", as: "thank_you"

  resources :carts, only: [:index, :update]
  resources :items, only: [:create, :destroy]
  resources :orders, only: [:index, :show, :new, :create]
  resources :addresses

  namespace :admin do
    devise_scope :admins do
      root 'orders#index'
      resources :orders
      resources :delivery_boys
      resources :time_slots
      resources :food_items
      resources :localities
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
