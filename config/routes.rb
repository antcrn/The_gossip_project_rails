Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "gossips#index"
  resources :gossips
  resources :users, only: [:create, :show]
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  resources :cities, only: [:index, :show]    
  resources :comments    
  get '/team', to: 'team#team'
  get '/contact', to: 'contact#contact'
  get '/welcome/:name', to: 'welcome#welcome'
  resources :gossips do
    resources :likes
  end
end
