class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :sell, foreign_key: true
      t.timestamps
    end
  end
end
