class MenusApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get_list_menu
        @menus = Menu.all
        
        render json:@menus.as_json(include: :categories), status: :ok

    end

    def add_menu
        @menu = Menu.new(name: params[:name], price: params[:price], description:  params[:description])
        if params.has_key?(:categories) 
            params[:categories].each do |item|
                @menu.categories<<Category.find(item)
            end
        end

        if @menu.save
            render json:@menu.as_json, status: :created
        else
            render json:{"message"=>"cek value and format name, category, price,menu name must be unique"}, status: :bad_request
        end
    end

    def edit_menu
        if Menu.exists?(params[:id])
            @menu = Menu.find(params[:id])
        else
            render json:{"message"=>"menu is not found"}, status: :bad_request
          return
        end
        
        
          
        if params.has_key?(:name)
            @menu.name = params[:name]
        end

        if params.has_key?(:price)
            @menu.price = params[:price]
        end

        if params.has_key?(:description)
            @menu.price = params[:description]
        end
        updated_categories = []
        if params.has_key?(:categories) 
            params[:categories].each do |item|
                updated_categories<<Category.find(item)
            end
        end
        @menu.categories = updated_categories

        if @menu.save
            render json:@menu.as_json, status: :created
        else
            render json:{"message"=>"cek value and format name, category, price, menu name must be unique"}, status: :bad_request
        end

    end

    def delete_menu
        if Menu.exists?(params[:id])
            Menu.destroy(params[:id])
            render json:{"message"=>"succes"}, status: :ok
        else
            render json:{"message"=>"menu is not found"}, status: :not_found
        end
    end

    def show_menu
        if Menu.exists?(params[:id])

            render json:Menu.find(params[:id]).as_json(include: :categories), status: :ok
        else
            render json:{"message"=>"menu is not found"}, status: :not_found
        end
    end
end
