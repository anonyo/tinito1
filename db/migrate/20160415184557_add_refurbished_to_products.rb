class AddRefurbishedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :refurbished, :boolean, default: false
  end
end
