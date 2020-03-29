Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  
  # Session routes
  get 'login', to: 'sessions#new'
  get 'signup', to: 'sessions#new_signup'
  post 'login', to: 'sessions#signin'
  post 'signup', to: 'sessions#signup'
  get 'signout', to: 'sessions#signout'
  
  root 'home#index'
end
