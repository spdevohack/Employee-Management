Rails.application.routes.draw do
  devise_for :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "organizations#index"
  resources :employees
  resources :departments
end
