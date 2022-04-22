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

  # order routes
  get "/api/order", to: "orders_api#get_list_orders"
  post "/api/order", to: "orders_api#add_order"
  patch "/api/order/:id/status", to: "orders_api#set_order_status"
  get "/api/order/:id", to: "orders_api#show_order"

  # reports routes
  get "/api/report", to: "reports_api#get_today_report"
  get "/api/report/customer", to: "reports_api#get_report_by_email"
  get "/api/report/date", to: "reports_api#get_report_by_date"
  get "/api/report/date/range", to: "reports_api#get_report_by_date_range"
  get "/api/report/price", to: "reports_api#get_report_by_price"
end
