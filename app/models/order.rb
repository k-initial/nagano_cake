# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  address        :string
#  name           :string
#  order_status   :integer          default(0), not null
#  payment_method :integer          default(0), not null
#  post_code      :string
#  postage        :integer
#  total_payment  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :integer
#
class Order < ApplicationRecord
  belongs_to :customer
	has_many :order_details, dependent: :destroy

end
