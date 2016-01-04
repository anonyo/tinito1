class ChangePriceTypeInProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, :integer
    change_column :products, :retail, :integer
  end
end
