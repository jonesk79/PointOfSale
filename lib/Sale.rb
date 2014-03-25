class Sale < ActiveRecord::Base
  attr_reader :cashier_name, :item, :quantity

  def sale(attributes)
    @cashier_name = attributes[:cashier_name]
    @item = attributes[:item]
    @quantity = attributes[:quantity]
  end

end

