Rails.application.routes.draw do
 
  resources :projects do
    resources :user_stories
  end
 
  root 'projects#index'
  
end
