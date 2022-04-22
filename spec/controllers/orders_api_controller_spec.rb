require 'rails_helper'

RSpec.describe OrdersApiController do
   describe 'GET #order' do

        it 'get list order should get response ok' do
            get :get_list_orders
            expect(response).to have_http_status(:ok)
        end

    

      it 'show menu should get response not found(404) when order with corespondig index doesnt exist' do
            get :show_order, params: { id: 1000 }
            expect(response).to have_http_status(:not_found)
        end

   
 end

    describe 'POST #orders' do
          it 'add order should return response bad request when param is invalid' do
            post :add_order, params: { name: "ahhahahah" }
            expect(response).to have_http_status(:bad_request)
        end
  end
end