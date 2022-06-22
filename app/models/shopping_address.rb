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
end
