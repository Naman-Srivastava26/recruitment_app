# frozen_string_literal: true

Rails.application.routes.draw do
  resources :jobs
  resources :job_applications
  resources :notes
  resources :candidates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
