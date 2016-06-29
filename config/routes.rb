Rails.application.routes.draw do
 
  
  devise_for :users
  
  resources :projects do
    resources :user_stories do
    end
  end
  
  resources :user_stories do
    post :update_row_order, on: :collection
  end
 
  root 'welcome#index'
  
end
