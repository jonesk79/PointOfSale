class RemoveItemFromSale < ActiveRecord::Migration
  def change
        remove_column :sales, :item, :string
  end
end
