require 'spec_helper'

describe 'Sale' do
  it 'makes the sale' do
    test_sale = Sale.create({:cashier_name => "Manuel", :item => "Soap"})
    Sale.all.should eq [test_sale]
  end
end
