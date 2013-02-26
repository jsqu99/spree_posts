# class Spree::PossiblePage
#   def self.matches?(request) 
#     return false if request.path =~ /(^\/+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+)/
#     !Spree::Post.published.find_by_permalink(request.path[1..-1]).nil?
#   end
# end

Spree::Core::Engine.routes.draw do

  
  
  namespace :admin do
    resources :posts
  end
  
  resources :posts
  
  # constraints(Spree::PossiblePage) do
  #   match 'blog/(:id)', :to => 'posts#show'
  # end

end
