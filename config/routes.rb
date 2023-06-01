Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :rentings, only: [:new, :create, :destroy, :edit]
  end
  resources :rentings, only: [:index]
end
