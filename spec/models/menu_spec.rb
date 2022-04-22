require 'rails_helper'

RSpec.describe Menu, type: :model do
 let(:menu_category) { Category.new(name:"makanan penutup") }
  it 'is valid without description' do
    menu = Menu.new(
      name: "makanan tes",
      price: 15,
      categories: [menu_category]
    )

    expect(menu).to be_valid
  end
  
  it 'is invalid without name' do
    menu = Menu.new(
      name: nil,
      price: 15,
      categories: [menu_category]
    )

    expect(menu).to be_invalid
  end

  it 'is invalid with a duplicate name' do
    men1 = Menu.create(
                        name:"bakso sosis", 
                        price:15, 
                        categories: [menu_category])
    men = Menu.new(
      name: "bakso sosis",
      price: 15,
      categories: [menu_category]
    )

    expect(men).to be_invalid
  end

  it 'is invalid with price below 0.01' do
    menu = Menu.new(
      name: "kecap",
      price: 0,
      categories: [menu_category]
    )

    expect(menu).to be_invalid
  end

  it 'is invalid without categories' do
    menu = Menu.new(
      name: "kecap",
      price: 15
    )

    expect(menu).to be_invalid
  end
end
