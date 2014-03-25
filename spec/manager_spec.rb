require 'spec_helper'

describe 'Manager' do
  it 'Creates a new manager in the system' do
    test_manager = Manager.create({:name => "KeMonte"})
    Manager.all.should eq [test_manager]
  end
  describe "add_product" do
    it 'Allows manager to add a product into the system' do
      test_manager = Manager.create({:name => "KeMonte"})
      test_manager.add_product({:name => "Soap", :price => 6.99})
      Product.all.first[:name].should eq "Soap"
    end
  end
  describe "add_cashier" do
    it 'Allows manager to add a cashier into the system' do
      test_manager = Manager.create({:name => "KeMonte"})
      test_manager.add_cashier({:name => "Manuel", :password => "epicodus"})
      Cashier.all.first[:name].should eq "Manuel"
      Cashier.all.first[:password].should eq "epicodus"
    end
  end

  # describe 'track_sales' do
  #   it 'tracks the total ammount of sales each day' do
  #     test_manager = Manager.create({:name => "KeMonte"})
  #     test_cashier = Cashier.create({:name => "Manuel"})
  #     test_manager.track_sales
  #     test_manager.track_sales.should eq test_cashier.receipt
  #   end
  # end
end

