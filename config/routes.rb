Rails.application.routes.draw do
  get 'projects/index'
  get 'projects/new'
  # get 'projects/:id/edit'
  get 'projects/show'
  # get 'projects/team' => "projects#team"
  get 'projects/:id/team' => "projects#team",  :as => "team"
  post'projects/:id/add' => "projects#add", :as => 'add_team'
  # patch 'projects/:id/join' => 'projects#join'

  delete 'projects/:id/remove' => "projects#remove", :as => 'remove_member'
  devise_for :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "organizations#index"
  post 'checkin', to: 'attandences#checkin'
  resources :employees
  resources :departments
  resources :projects
end
