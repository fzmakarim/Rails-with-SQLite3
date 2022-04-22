class CategoriesApiController < ApplicationController
   skip_before_action :verify_authenticity_token

    def get_list_category
        @categories = Category.all
        render json:@categories.as_json, status: :ok
    end

    def add_category
        @category = Category.new(name: params[:name].strip)
        if @category.save
            render json:@category.as_json, status: :ok
        else
            render json:{"message"=>"category can't contain duplicte name"}, status: :bad_request
        end
        
    end

    def show_category
        if Category.exists?(params[:id])
            render json:Category.find(params[:id]).as_json, status: :ok
        else
            render json:{"message"=>"category doesnt exist"}, status: :bad_request
        end
    end
end
