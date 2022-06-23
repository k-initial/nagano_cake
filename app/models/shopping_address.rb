# == Schema Information
#
# Table name: shopping_addresses
#
#  id          :integer          not null, primary key
#  address     :string
#  name        :string
#  post_code   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#
class ShoppingAddress < ApplicationRecord
  belongs_to :customer
    validates :customer_id, :name, :address, presence: true
    validates :post_code, length: {is: 7}, numericality: { only_integer: true }
    
  def order_address
    self.post_code + self.address + self.name
  end
end
