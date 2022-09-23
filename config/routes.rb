Rails.application.routes.draw do
  devise_for :users

  resources :friendships, only: [:index, :create, :update, :destroy]

  resources :profiles, only: [:show, :edit, :update]

  resources :posts do
    resources :comments
    member do
      post "like" => "posts#like"
      post "unlike" => "posts#unlike"
    end
  end

  resources :comments do
    member do
      post "like" => "comments#like"
      post "unlike" => "comments#unlike"
    end
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:create]
  end
    
  unauthenticated do
    root "pages#home"
  end

  authenticated :user do
    get "/", to: redirect('/posts')
  end
end
