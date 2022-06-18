class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :non_taxed_price
      t.string :item_image_id
      t.boolean :is_sales_status,  default: true
      
      t.timestamps
    end
  end
end
