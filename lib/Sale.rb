class Sale < ActiveRecord::Base
  has_many(:products)

  def quantity
    self[:quantity]
  end

  def product_price
    @product = Product.where({:id => self[:product_id]}).first
    product[:price]
  end

  def sale_total
    @sale_total = item_price * quantity
  end

end

