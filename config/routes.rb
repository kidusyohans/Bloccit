Rails.application.routes.draw do

  get 'users/update'

devise_for :users
resources :user, only: [:show]
  resources :questions
  
  resources :topics do
    resources :posts, except: [:index] do
      resources :summaries
    end
  end
  
  resources :advertisements
  
  

  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  

end
