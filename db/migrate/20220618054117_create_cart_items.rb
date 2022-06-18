class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      
      t.integer :customer_id
      t.integer :item_id
      t.integer :quantity
      t.timestamps
    end
  end
end
