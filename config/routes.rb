Rails.application.routes.draw do
  devise_for :users
  root to: "feed#index"

  resources :posts do
    member do
      get "delete" => "posts#delete", as: :delete
      post "react" => "reactions#create", as: :react
    end

    resources :comments do
      member do
        get "delete" => "comments#delete", as: :delete
      end
    end
  end

  resources :users, path: "profile", only: [:show]
end
