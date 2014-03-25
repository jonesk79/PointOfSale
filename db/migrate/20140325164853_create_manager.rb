class CreateManager < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
