class CreatePlan < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
