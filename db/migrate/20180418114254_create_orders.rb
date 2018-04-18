class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: false do |t|
      t.bigint :cutomer_id, references: [:Customer, :customer_id]
      t.bigint :product_id, references: [:Product, :product_id]
      t.date :order_date

      t.timestamps
    end
  end
end
