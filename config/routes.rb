Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # category routes
  get "/api/category", to: "categories_api#get_list_category"
  post "/api/category", to: "categories_api#add_category"
  get "/api/category/:id", to: "categories_api#show_category"
end
