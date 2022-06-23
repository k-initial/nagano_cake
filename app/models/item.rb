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

end
