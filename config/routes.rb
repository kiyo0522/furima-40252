Rails.application.routes.draw do
  devise_for :users
  

  root 'items#index' # ルートパスを items#index に設定
   resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] 
end
