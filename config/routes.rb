Rails.application.routes.draw do
  get "/", to: 'pages#home', as: 'home_page'
  post "/", to: 'urls#create'
  get "*path", to: "urls#search", via: :all
end
