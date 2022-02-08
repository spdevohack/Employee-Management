Rails.application.routes.draw do
  get 'projects/index'
  get 'projects/new'
  # get 'projects/:id/edit'
  get 'projects/show'
  devise_for :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "organizations#index"
  post 'checkin', to: 'attandences#checkin'
  resources :employees
  resources :departments
  resources :projects
end
