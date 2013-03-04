Spree::Core::Engine.routes.draw do
 
  namespace :admin do
    resources :posts
  end
  
  get '/archive/:year(/:month)',  to: 'posts#find_by_archive'
  get 'blog/category/:tag',       to: 'posts#index', as: :tag  
  resources :posts, :path => 'blog'



end
