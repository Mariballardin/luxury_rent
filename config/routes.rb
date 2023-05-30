Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :products, only: [:index, :show, :new, :create, :destroy] do
    resources :reservations, only: [:new, :create, :destroy, :edit, :update]
  end
end
