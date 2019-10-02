Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  
  resources :users, only: [:edit, :update,:show] do
    member do
      get "user_liked"
    end
    resources :profiles, only: [:edit, :update,:destroy]
  end
  resources :posts, only: [:index, :show,:create,:new,:destroy],shallow:true do
    collection do
      get "popular"
    end
    resources :memoirs do
      collection do
        get "add"
      end
      post   '/like/:memoir_id' => 'likes#create',   as: 'like'
      delete '/like/:memoir_id' => 'likes#destroy', as: 'unlike'
    end
      resources :comments, only: [:create]
  end
end