Rails.application.routes.draw do
  devise_for :users

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :ckechout
    end
  end

  resources "cart_items"

  root 'products#index'

  namespace :admin do
    resources :products
  end
  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :account do
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
