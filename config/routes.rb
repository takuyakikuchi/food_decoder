Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products, only: [:show, :new, :create, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  resources :histories, only: [:index, :update]

  get '/scan-barcodes', to: 'scans#new'
  post '/scan-barcodes', to: 'scans#create'
  get '/scan-labels', to: 'scans#new'
  post '/scan-labels', to: 'scans#create'

end
