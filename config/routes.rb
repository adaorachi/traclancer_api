Rails.application.routes.draw do
  root to: "static#home"
  namespace :api do 
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"

      resources :projects
      resources :project_categories, param: :slug
      resources :project_stages, only: [:show, :create]
      resources :project_milestones, only: [:show, :create]
      resources :milestone_subtasks, only: [:show, :create]
      get 'claimed_projects', to: 'projects#claimed_projects'
      get 'available_projects', to: 'projects#available_projects'
      get 'completed_projects', to: 'projects#completed_projects'
      get 'created_projects', to: 'projects#created_projects'
      
    end
  end
  get '*path', to: 'static#home', via: :all
end