class Menu < ApplicationRecord
    has_and_belongs_to_many :categories do
        def get_names
          
          map(&:name)
        end
    end
    validates :name, presence: true,  uniqueness: true
    validates :price, presence: true, numericality: true, comparison: {greater_than_or_equal_to: 0.01 }
    validates :categories, presence: true
  
end
