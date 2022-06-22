# == Schema Information
#
# Table name: order_details
#
#  id            :integer          not null, primary key
#  making_status :integer          default(0), not null
#  price         :integer
#  quantity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  item_id       :integer
#  order_id      :integer
#
class OrderDetail < ApplicationRecord
  belongs_to :order
	belongs_to :item
end
