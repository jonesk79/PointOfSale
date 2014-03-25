require 'spec_helper'

describe 'Product' do
  it 'adds a new product to the point of sale system' do
    test_product = Product.create({:name => 'Soap', :price => 6.99})
    Product.all.should eq [test_product]
    test_product[:price].should eq 6.99
  end
end
