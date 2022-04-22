require 'rails_helper'

RSpec.describe CategoriesApiController do
 describe 'GET #catgory' do

        it 'get all category should get response ok' do
            get :get_list_category
            expect(response).to have_http_status(:ok)
        end

   
 end

  describe 'POST #catgory' do

        it 'add category should return response ok' do
            post :add_category, params: { name: "ahhahahah" }
            expect(response).to have_http_status(:ok)
        end

             it "add category should return bad request when contain duplicate name category" do
     Category.create(name: "makanan konoha")
     post :add_category, params: { name: "makanan konoha" }
            expect(response).to have_http_status(:bad_request)
  
        end


   
    end


end