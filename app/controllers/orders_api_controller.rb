class OrdersApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get_list_orders
        @orders = Order.all
        render json:@orders.as_json(include: :items), status: :ok
    end

    def show_order
        if Order.exists?(params[:id])
            render json:Order.find(params[:id]).as_json(include: :items), status: :ok
        else
            render json:{}, status: :bad_request
        end
    end

    def set_order_status
        if Order.exists?(params[:id]) && params.has_key?(:status) 
            @order = Order.find(params[:id])
            if @order.set_status(params[:status])
                render json:@order.as_json(include: :items), status: :ok
            else
                render json:{}, status: :bad_request
            end

        else
            render json:{}, status: :bad_request
        end
        
    end


    def add_order
        Order.transaction do
            Order.transaction do 
                @order = Order.new
                if params.has_key?(:menus) 
                    params[:menus].each do |menu|
                        item = Item.new
                        item_menu = Menu.find(menu[:id])
                        item_menu_total = menu[:total]
                        item.set_menu(item_menu, item_menu_total)
                        @order.add_item(item)
                        item.save!
                        
                    end
                end

                @order.email_customer = params[:email_customer]
                @order.save! 
                render json:@order.as_json(include: :items), status: :created
                return
            end
        end
        render json:{}, status: :bad_request


    end
end
