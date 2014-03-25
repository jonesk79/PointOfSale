require 'spec_helper'

describe 'Cashier' do
  it 'adds a new cashier to the point of sale system' do
    test_cashier = Cashier.create({:name => 'Manuel'})
    Cashier.all.should eq [test_cashier]
  end

  describe 'checkout' do
    it 'Allows cashier to checkout a customer with a product amount' do
      test_cashier = Cashier.create({:name => 'Manuel'})
      test_product = Product.create({:name => "Listerine", :price => 2.00})
      test_product2 = Product.create({:name => "Soap", :price => 3.00})
      test_cashier.checkout([{:itemname => "Listerine", :quantity => 3}, {:itemname => "Soap", :quantity => 3}]).should eq 15.00
    end
  end

  describe 'add_to_receipt' do
    it 'allows customers to see all purchashed items with total' do
      test_cashier = Cashier.create({:name => 'Manuel'})
      test_product = Product.create({:name => "Listerine", :price => 2.00})
      test_product2 = Product.create({:name => "Soap", :price => 3.00})
      test_cashier.checkout([{:itemname => "Listerine", :quantity => 3}, {:itemname => "Soap", :quantity => 3}]).should eq 15.00
      test_cashier.receipt.first[:item].should eq "Listerine"
      test_cashier.receipt.second[:item].should eq "Soap"
      # test_cashier.receipt.should eq [checkout]
    end
  end

  describe 'tracks_receipt' do
    it 'keeps track of all cashier receipts' do
      test_cashier = Cashier.create({:name => "Manuel"})
      test_product = Product.create({:name => "Listerine", :price => 2.00})
      test_product2 = Product.create({:name => "Soap", :price => 3.00})
      test_cashier.checkout([{:itemname => "Listerine", :quantity => 3}, {:itemname => "Soap", :quantity => 3}]).should eq 15.00
      test_cashier.tracks_receipt
      test_cashier.all_receipts.first[:receipt_total].should eq test_cashier.final_total
    end
  end
end
