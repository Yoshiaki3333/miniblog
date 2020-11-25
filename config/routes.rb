Rails.application.routes.draw do
  devise_for :users
    root 'top#index'
    resources :tweets do
      resources :comments, only:[:create, :destroy]
    end
    resources :users, only:[:show]
end
