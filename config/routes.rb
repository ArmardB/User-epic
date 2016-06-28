Rails.application.routes.draw do
 
  resources :projects do
    resources :user_stories, :only => [:index] do
      member do
        post :move
      end
    end
  end
 
  root 'projects#index'
  
end
