Andromeda::Application.routes.draw do
  devise_for :users

  namespace :user do
    root :to => "clusters#index"
  end

  root :to => "home#index"
end


