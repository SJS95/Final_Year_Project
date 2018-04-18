class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers, id: false do |t|
      t.primary_key :cutomer_id
      t.string :forename
      t.string :surname
      t.string :address
      t.string :postcode
      t.string :county
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
