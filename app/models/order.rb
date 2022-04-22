class Order < ApplicationRecord
    validates :email_customer, email: {mode: :strict, require_fqdn: true}, presence: true 
    has_many :items
    validates :items, presence: true

    def add_item(item)
        self.items << item
        self.total_price += item.price
    end

    def set_status(status)
        status = status.strip
        status = status.upcase
        if status!="NEW" && status!="PAID" && status!="CANCELED"
            return false
        end
        self.status = status
        return true
    end 
end
