Rails.application.routes.draw do
  root to: 'static#home'
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: 'sessions#logout'
      get :logged_in, to: 'sessions#logged_in'

      resources :projects, except: [:index]
      resources :claimed_projects
      resources :claimed_project_stats
      resources :project_categories, param: :slug
      resources :project_stages, only: %i[show create]
      resources :project_milestones, only: %i[show create]
      resources :milestone_subtasks, only: %i[show create]
    end
  end
  get '*path', to: 'static#home', via: :all
end
