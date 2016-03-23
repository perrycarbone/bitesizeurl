Rails.application.routes.draw do
  get "/", to: 'pages#home', as: 'home_page'
  post "/", to: 'urls#create'
  resources :urls, only: [:show]
  get "*path", to: "urls#search", via: :all

end
