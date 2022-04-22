require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is invalid without menu' do
 
    item = Item.new(total: 2,price: 3000)

    expect(item).to be_invalid
  end
end
