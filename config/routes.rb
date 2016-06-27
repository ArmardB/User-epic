Rails.application.routes.draw do
 
  resources :user_stories
  resources :projects
 root 'projects#index'
end
