class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.column :cashier_name, :string
      t.column :item, :string

      t.timestamps
    end
  end
end
