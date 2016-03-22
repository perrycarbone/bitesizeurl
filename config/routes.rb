Rails.application.routes.draw do
  root to: 'pages#home'
  get "*path", to: "urls#search", via: :all
end
