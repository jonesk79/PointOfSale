class Cashier < ActiveRecord::Base
  has_many :sales
  has_many :products, through: :sales

  def view_products
    Product.all
  end

  def checkout(product_hash)
    price_total = []
    products = []
    product_hash.each do |product|
      itemname = product[:itemname]
      quantity = product[:quantity]
      checkout_item = Product.where({:name => itemname}).first
      item_total = checkout_item[:price] * quantity
      price_total << item_total
      products << {:item => checkout_item[:name], :item_price => checkout_item[:price], :quantity => quantity, :item_total => item_total}
    end
    add_to_receipt(products)
    @final_total = price_total.inject {|result,price| result+price}
  end

  def add_to_receipt(products)
    @all_receipts = []
    @receipt = []
    products.each {|product| @receipt << product}
    @receipt_total = @final_total
  end

  def tracks_receipt
    @all_receipts << {:receipt => @receipt, :receipt_total => @final_total}
    @all_receipts
  end
end

# Create a sales class that generates receipts
##add column for receipts and total sales for the day
### Manager looks at total sales
