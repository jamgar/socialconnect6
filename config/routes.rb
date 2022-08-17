Rails.application.routes.draw do
  resources :posts
  devise_for :users


  unauthenticated do
    root "pages#home"
  end

  authenticated :user do
    root "posts#index", as: :authenticate_root
  end
end
