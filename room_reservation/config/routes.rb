Rails.application.routes.draw do
  resources :meeting_rooms, only: [:index] do
    resources :reservations, only: [:index, :create]
  end
end
