Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/products' => "products#index"
  post '/products/find' => "products#search"
  post '/products/new' => "products#create"

  post '/login', controller: :signin, action: :create
  #post '/login', controller: :sessions, action: :create
  delete '/logout', controller: :signin, action: :destroy

  post '/company/register' => "users#create"

  get '/block' => "productblock#index"
end
