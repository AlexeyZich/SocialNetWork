Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :edit, :update] do 
    member do
      post :add_to_friend
      post :create_post
      # /users/:id/add_to_friend
      # /users/2/add_to_friend
      # /users/2/create_post
      
    end
  end

  resources :conversations, only: [:index, :create, :new] do
    resources :messages, only: [:index, :new, :create]
  end

  resources :friend_requests, only: [:index] do
    member do
      put :approve
      put :decline
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
