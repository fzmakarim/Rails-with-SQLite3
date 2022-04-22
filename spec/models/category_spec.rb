require 'rails_helper'

RSpec.describe Category, type: :model do
 it 'is invalid without name' do
    cat = Category.new(
      name: nil
    )

    expect(cat).to be_invalid
  end

  it 'is invalid with a duplicate name' do
    cat1 = Category.create(name:"chill")
    cat = Category.new(
      name: "chill"
    )

    expect(cat).to be_invalid
  end

end
