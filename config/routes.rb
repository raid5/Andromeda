Andromeda::Application.routes.draw do
  devise_for :users
  
  resources :clusters

  match '/clusters' => 'clusters#index', :as => 'user_root'

  root :to => "home#index"
end


