Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"
  resources :users
  resources :businesses
  resources :jobs do
    resources :tasks do
      resources :comments, shallow: true
    end
  end
  resources :answers, only: [:new, :create, :edit, :update, :destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
