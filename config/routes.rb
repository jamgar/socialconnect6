Rails.application.routes.draw do
  resources :profiles, only: [:show, :edit, :update]
  resources :posts do
    resources :comments
    member do
      post "like" => "posts#like"
      post "unlike" => "posts#unlike"
    end
  end

  devise_for :users

  resources :comments do
    member do
      post "like" => "comments#like"
      post "unlike" => "comments#unlike"
    end
  end

  unauthenticated do
    root "pages#home"
  end

  authenticated :user do
    root "posts#index", as: :authenticate_root
  end
end
