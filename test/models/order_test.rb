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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
