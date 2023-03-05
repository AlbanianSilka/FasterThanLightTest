Rails.application.routes.draw do
  get 'users/show'
  get 'rooms/index'
  devise_for :users
  resources :expenses
  resources :expense_types
  resources :rooms do
    resources :messages
  end
  get 'user/:id', to: 'users#show', as: 'user'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
