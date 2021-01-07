Rails.application.routes.draw do
  get 'sells/index'
  get 'sells/new'
  devise_for :users
  root to: 'sells#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sells, only: [:index, :new, :create, :show, :edit, :update]
end
