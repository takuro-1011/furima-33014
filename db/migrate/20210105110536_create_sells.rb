class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|
      t.string :product_name
      t.text :product_description
      t.integer :category_id
      t.integer :product_condition_id
      t.integer :delivery_fee_id
      t.integer :shipping_area_id
      t.integer :day_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
