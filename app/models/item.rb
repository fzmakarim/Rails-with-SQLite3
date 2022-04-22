class Item < ApplicationRecord
    belongs_to :menu
    belongs_to :order
    validates :menu, presence: true
    validates :price, presence: true, numericality: true, comparison: {greater_than_or_equal_to: 0.01 }
    validates :total, presence: true, numericality: true, comparison: {greater_than_or_equal_to: 1 }

    def set_menu(menu, total=1)
        self.menu = menu
        self.total = total
        self.price = total * menu.price
    end
end
