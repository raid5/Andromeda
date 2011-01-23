Andromeda::Application.routes.draw do
  devise_for :users
  
  resources :clusters

  namespace :user do
    root :to => "clusters#index"
  end

  root :to => "home#index"
end


