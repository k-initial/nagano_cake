class CreateShoppingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_addresses do |t|
      
      t.integer :customer_id
      t.string :post_code
      t.string :address
      t.string :name
      
      t.timestamps
    end
  end
end
