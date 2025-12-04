Rails.application.routes.draw do
  resources :users do
    resources :bookmarks, only: [:index, :create, :destroy]
  end
end
