class CashRegister
  attr_accessor :total, :discount


  def initialize (discount= nil)
    @total = 0
    @discount = discount
    @items = []
    @item_hash = {}
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @total += price*quantity
    quantity.times do @items << title
    end
    @item_hash[title] = price
  end

  def apply_discount
    if discount
      @total = @total *(1- @discount/100.00)
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @item_hash[@items.last]
  end


end
