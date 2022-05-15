Rails.application.routes.draw do
    root 'tweets#index' 
  
    devise_for :users
    
    resources :tweets do
      resource :favorites, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end
    resources :users do
      resource :relationships, only: [:create, :destroy]
        get :follows, on: :member # 追加
        get :followers, on: :member # 追加
    end
end
