Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Like routes
  get 'posts/:article_id/like/:type', to: 'likes#like', as: 'like'

  # User routes
  get ':first_name/profile', to: 'users#profile', as: 'profile'
  get ':first_name/profile/edit', to: 'users#edit', as: 'edit_profile'
  patch ':first_name/profile/edit', to: 'users#update', as: 'update_profile'

  # Article routes
  get 'new-post', to: 'articles#new'
  post 'new-post', to: 'articles#create'
  get 'me/posts/:slug/edit', to: 'articles#edit', as: 'edit_post'
  patch 'me/posts/:slug/edit', to: 'articles#update', as: 'update_post'
  patch 'me/posts/:slug/publish', to: 'articles#publish', as: 'publish_post'
  get ':first_name/:slug', to: 'articles#show', as: 'post'
  get 'me/:slug', to: 'articles#show', as: 'my_post'
  get 'me/posts/:slug/preview', to: 'articles#preview', as: 'preview'
  get 'me/posts/drafts', to: 'articles#draft_posts', as: 'my_drafts'
  get 'me/posts/published', to: 'articles#published_posts', as: 'my_published'
  delete 'me/posts/:slug', to: 'articles#destroy', as: 'delete_post'
  get 'me/posts/:slug', to: 'articles#modal', as: 'modal_post'

  # Session routes
  get '/login', to: 'sessions#new'
  get '/signup', to: 'sessions#new_signup'
  post '/login', to: 'sessions#signin'
  post '/signup', to: 'sessions#signup'
  get '/signout', to: 'sessions#signout'
  
  root 'home#index'
end
