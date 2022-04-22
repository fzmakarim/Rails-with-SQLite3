class ReportsApiController < ApplicationController
    def get_today_report
        @orders = Order.where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day)
        render json:@orders.as_json(include: :items), status: :ok
    end

    def get_report_by_email
        @orders = Order.where(email_customer:params[:email])
        render json:@orders.as_json(include: :items), status: :ok
    end

    def get_report_by_price
        @orders = Order.where('total_price > ?', params[:price])
        render json:@orders.as_json(include: :items), status: :ok
    end

    def get_report_by_date
        selected_date = params[:date].to_date
        @orders = Order.where(:created_at => selected_date.beginning_of_day..selected_date.end_of_day)
        render json:@orders.as_json(include: :items), status: :ok
    end

    def get_report_by_date_range
        selected_date_start = params[:start_date].to_date
        selected_date_end = params[:end_date].to_date
        @orders = Order.where(:created_at => selected_date_start.beginning_of_day..selected_date_end.end_of_day)
        render json:@orders.as_json(include: :items), status: :ok
    end
end
