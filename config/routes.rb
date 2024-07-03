Rails.application.routes.draw do
  devise_for :users
  
   root  'items#index' # ルートパスを items#index に設定
 
   resources :items, only:  [:index, :new, :create, :show, :edit, :update, :destroy] do
   resources :orders, only: [:index, :create]
   resources :orders_addresses, only: [:index, :new, :create]
  end
end
