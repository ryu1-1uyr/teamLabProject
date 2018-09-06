Rails.application.routes.draw do
  
  get '/search' => "search#product"
  post '/search' => "search#test"


  get '/tester' => "tester#order"
  resources :orders
  resources :recommended_items
  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
