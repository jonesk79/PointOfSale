require 'active_record'
require 'rspec'
require 'pg'

require 'manager'
require 'product'
require 'cashier'
require 'sale'

database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["test"]
ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Product.all.each { |product| product.destroy }
    Cashier.all.each { |cashier| cashier.destroy }
    Manager.all.each { |manager| manager.destroy }
    Sale.all.each { |sale| sale.destroy }
  end
end
