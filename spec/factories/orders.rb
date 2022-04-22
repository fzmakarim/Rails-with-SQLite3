FactoryBot.define do
  factory :order do
    email_customer { "MyString" }
    status { "MyString" }
    total_price { "9.99" }
  end
end
