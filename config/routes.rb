Rails.application.routes.draw do
  devise_for :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "organizations#index"
  post 'checkin', to: 'attandences#checkin'
  resources :employees
  resources :departments
end
