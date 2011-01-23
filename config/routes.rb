Andromeda::Application.routes.draw do
  devise_for :users
  
  resources :clusters

  root :to => "home#index"
end
