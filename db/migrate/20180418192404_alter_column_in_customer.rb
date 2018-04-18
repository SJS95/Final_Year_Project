class AlterColumnInCustomer < ActiveRecord::Migration[5.1]
  def change
    rename_column :customers, :cutomer_id, :customer_id
  end
end
