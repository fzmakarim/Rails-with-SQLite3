require 'rails_helper'

RSpec.describe Order, type: :model do
 let(:order_item) { Item.new(menu:Menu.new(name:"test", price:5), price:5, total:1) }

  it 'is valid with complete attribute' do
   order = Order.new(email_customer:"mahmudfz20@gmail.com")
   order.add_item(order_item)

   expect(order).to be_valid
  end

  it 'is invalid without correct email' do
    order = Order.new(email_customer:"mahmudfz20@gmail")
    order.add_item(order_item)
 
    expect(order).to be_invalid
   end

   it 'total price still valid when menu price changed' do
    order = Order.new(email_customer:"mahmudfz20@gmail")
    order.add_item(order_item)

    order_item.price = 10
 
   
    expect(order.total_price).to eq(5)
   end

   
   it 'is invalid without item menu' do
    order = Order.new(email_customer:"mahmudfz20@gmail")
    
 
    expect(order).to be_invalid
   end

end
