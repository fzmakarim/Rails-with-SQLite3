Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # category routes
  get "/api/category", to: "categories_api#get_list_category"
  post "/api/category", to: "categories_api#add_category"
  get "/api/category/:id", to: "categories_api#show_category"

  #menus routes
  get "/api/menu", to: "menus_api#get_list_menu"
  get "/api/menu/:id", to: "menus_api#show_menu"
  post "/api/menu", to: "menus_api#add_menu"
  patch "/api/menu/:id", to: "menus_api#edit_menu"
  delete "/api/menu/:id", to: "menus_api#delete_menu"
end
