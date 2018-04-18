class AlterColumnInOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :cutomer_id, :customer_id
  end
end
