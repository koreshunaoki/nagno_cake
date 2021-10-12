class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre
    attachment :image
    
    def sum_of_price
    item.taxin_price * quantity
    end  

    def taxin_price
        price*1.1
    end
end
