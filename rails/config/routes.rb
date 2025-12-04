Rails.application.routes.draw do
  resources :products , only: [:index] do
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :users, only: [] do
    resources :bookmarks, only: [:index], controller: "users/bookmarks"
  end
end
