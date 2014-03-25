require 'spec_helper'

describe 'Sale' do
  it { should have_many :products }

  it 'makes the sale' do
    test_sale = Sale.create({:cashier_name => "Manuel"})
    Sale.all.should eq [test_sale]
  end

  describe 'sale_total' do
    it 'retrieves price of one product from db and calculates sales total' do
      test_product = Product.create({:name => "Soap", :price => 5.00})
      test_sale = Sale.create({:cashier_name => "Manuel", :product_id => test_product[:id], :quantity => 3})
      test_sale.sale_total.should eq 15
    end
    it 'retrieves price of multiple products from db and calculates sales total' do
      test_product1 = Product.create({:name => "Soap", :price => 5.00})
      test_product2 = Product.create({:name => "Bread", :price => 3.00})
      test_sale = Sale.create({:cashier_name => "Manuel", :product_id => test_product1[:id], :quantity => 3})
      test_sale.product.create(:name => test_product1)
      test_sale.sale_total.should eq 15
    end
  end
end
