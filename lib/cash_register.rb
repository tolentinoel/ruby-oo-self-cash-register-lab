require 'pry'

class CashRegister

  attr_accessor :total, :discount, :cart, :cost

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @cost = []
  end

  # def discount
  #   0.20 * 100.00
  # end

  def add_item(item, price, quantity=1)
    @total += price * quantity
    if quantity >= 1 && price > 0.00
      quantity.times {@cart << item}
      @cost << quantity * price
      # binding.pry
    end

  end

  def apply_discount
    if discount > 0
      @total -= @total * discount / 100
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    return @cart
  end

  def void_last_transaction
    @total -= @cost.last
  end


end

# stuff = CashRegister.new
# puts stuff
# stuff.add_item("ball", 3.00)
# puts stuff

