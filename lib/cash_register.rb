require "pry"

class CashRegister
    attr_accessor :discount, :total, :all_items, :title
    def initialize(discount=0)
        @discount = discount
        @total = 0
        @all_items = []
        @all_items_price = []
    end
    def total
        @total
    end
    def add_item(title, price, quantity=1)
        @title = title
        @price = price
        quantity.times {@all_items.push(@title)}
        quantity.times {@all_items_price.push(@price)}

        @total = @total + price * quantity
    end
    def apply_discount
        @total = @total - @discount * 10
        if @discount == 0
            return "There is no discount to apply."
        end
        "After the discount, the total comes to $#{@total}."
    end
    def items
        @all_items
    end
    def void_last_transaction
        @total = @total - @all_items_price.last 
        @all_items.pop
        @all_items_price.pop
        if !@all_items
            @total = 0.0
        end
    end
end

# cash_object = CashRegister.new()
# puts cash_object.instance_variables
# 
# binding.pry