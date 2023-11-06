Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"
  resources :products

  # get "products/:id" => "products#show", contraints { :id => /\d+/ }
  get "products/:id" => "products#show", contraints: { subdomain: "admin" }
  get "products/:id" => "products#show", id: /\d+/
  # protect resources with id less than 100
  get "products/:id" => "products#protected", contraint: proc {
                                                            |req| req.params[:id].to_i < 100
                                                          }
  get "products/:id" => "products#protected", contraint: ProtectedRecordsContraints.new

  # Rack as end points
  get "/home", to: proc { |env| [200, {}, ["hello world!"]] }

  get "products/list/*items", controller: "products", action: "list"


  get "products/q/*info", controller: "products", action: "query"


end
