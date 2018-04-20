class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: false do |t|
      t.references :customer
      t.references :product
      t.integer :quantity
      t.date :order_date

      t.timestamps
    end
  end
end
