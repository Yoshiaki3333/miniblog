Rails.application.routes.draw do
  devise_for :users
    root to: "top#index"
    resources :tweets, exept: [:index] do
      resources :comments, only:[:create, :destroy]
    end
    resources :users, only:[:show]
end
