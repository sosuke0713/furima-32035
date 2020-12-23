Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  resources :items do #7つアクション全て使用しているので
    resources :buyers, only:[:index, :create]
  end
end
