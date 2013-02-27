Spree::Core::Engine.routes.draw do
 
  namespace :admin do
    resources :posts
  end
    
  resources :posts, :path => 'blog'

end
