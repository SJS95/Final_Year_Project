class AddProductEndDateToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_end_date, :date
  end
end
