Rails.application.routes.draw do

 

  get 'users/update'

devise_for :users
resources :users, only: [:show, :update]
  resources :questions
  
  resources :topics do
    resources :posts, except: [:index] do
      resources :summaries
      resources :comments, only: [:create, :destroy]
    end
  end
  
  resources :advertisements
  
  

  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  

end
