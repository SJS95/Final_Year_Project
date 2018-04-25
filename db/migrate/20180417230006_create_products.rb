class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: false do |t|
      t.primary_key :product_id
      t.references :customer
      t.string :title
      t.text :description
      t.integer :price
      t.string :manufacturer
      t.string :model
      t.string :brand
      t.longblob :image
      t.integer :cheaper_target
      t.integer :cheaper_price
      t.integer :cheapest_target
      t.integer :cheapest_price

      t.timestamps
    end
  end
end
