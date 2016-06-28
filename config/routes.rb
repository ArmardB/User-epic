Rails.application.routes.draw do
 
  resources :projects do
    resources :user_stories do
      post :update_row_order, on: :collection
    end
  end
 
  root 'welcome#index'
  
end
