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
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
