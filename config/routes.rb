Andromeda::Application.routes.draw do
  devise_for :users
  
  resources :clusters do
    collection do
      get 'browse'
    end
    
    resources :posts
  end

  match '/clusters' => 'clusters#index', :as => 'user_root'

  root :to => "home#index"
end


