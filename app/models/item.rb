# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  introduction    :text
#  is_sales_status :boolean          default(TRUE)
#  name            :string
#  non_taxed_price :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  genre_id        :integer
#  item_image_id   :string
#
class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details
  
  has_one_attached :image
  
  def get_image(width, height)
   unless image.attached?
     file_path = Rails.root.join('app/assets/images/default-image.jpeg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
     image.variant(resize_to_limit: [width, height]).processed
  end
  
  def with_tax_price
     (non_taxed_price * 1.1).floor
  end
  
end
