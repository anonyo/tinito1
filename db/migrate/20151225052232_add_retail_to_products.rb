class AddRetailToProducts < ActiveRecord::Migration
  def change
    add_column :products, :retail, :decimal, precision: 12, scale: 2
  end
end
