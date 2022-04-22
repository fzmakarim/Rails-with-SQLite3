require 'rails_helper'

RSpec.describe MenusApiController do
  describe 'GET #menus' do

        it 'get list menus should get response ok' do
            get :get_list_menu
            expect(response).to have_http_status(:ok)
        end

    

      it 'show menu should get response not found(404) when menu with corespondig index doesnt exist' do
            get :show_menu, params: { id: 1000 }
            expect(response).to have_http_status(:not_found)
        end

   
 end
  describe 'POST #menus' do
          it 'add menu should return response bad request when param is invalid' do
            post :add_menu, params: { name: "ahhahahah" }
            expect(response).to have_http_status(:bad_request)
        end
  

   
          it 'add menu should return response created(201) when param is  complete' do
            Category.create(name:"makanan kohona")
            post :add_menu, params: { name: "ahhahahah", price:3000, categories:[1] }
            expect(response).to have_http_status(:created)
        
  end
  end

  describe 'DELETE #menus' do
    it "should return not found when menu with corespoding index doesnt exist" do
    post :delete_menu, params: { id: 1000 }
            expect(response).to have_http_status(:not_found)
    end
  end

  
end