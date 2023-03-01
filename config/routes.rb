Rails.application.routes.draw do
  devise_for :users
  resources :expenses
  resources :expense_types
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
