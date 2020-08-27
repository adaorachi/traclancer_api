# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#home'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  resources :projects
  resources :project_categories, param: :slug
  resources :project_stages, only: %i[show create]
  resources :project_milestones, only: %i[show create]
  resources :milestone_subtasks, only: %i[show create]
  get 'claimed_projects', to: 'projects#claimed_projects'
  get 'available_projects', to: 'projects#available_projects'
  get 'completed_projects', to: 'projects#completed_projects'
  get 'created_projects', to: 'projects#created_projects'

  get '*path', to: 'static#home', via: :all
end
