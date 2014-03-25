class Manager < ActiveRecord::Base
  attr_reader :name, :product

  def add_product(product)
    new_product = Product.create(product)
  end

  def add_cashier(cashier)
    new_cashier = Cashier.create(cashier)
  end
end
