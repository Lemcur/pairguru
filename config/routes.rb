Rails.application.routes.draw do
  devise_for :users
  get 'top10' => 'topcommenters#index'
  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
  resources :comments, only: [:create, :destroy]
end
