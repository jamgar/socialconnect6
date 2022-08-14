Rails.application.routes.draw do
  devise_for :users

  resources :notes

  unauthenticated do
    root "pages#home"
  end

  authenticated :user do
    root "notes#index", as: :authenticate_root
  end
end
