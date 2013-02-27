Spree::Core::Engine.routes.draw do
 
  namespace :admin do
    resources :posts
  end

  get 'blog/category/:tag', to: 'posts#index', as: :tag  
  resources :posts, :path => 'blog'

end
