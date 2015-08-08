Rails.application.routes.draw do
  namespace :api do
    resources :posts, only: [:index, :create, :destroy, :update, :show]
  end
end
