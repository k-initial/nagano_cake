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
	
	  validates :customer_id, :address, :name, :total_payment, :payment_method, presence: true
	  validates :post_code, length: {is: 7}, numericality: { only_integer: true }
    
    enum payment_method: {"クレジットカード": 0, "銀行振込": 1}
    # enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
    
    def full_address
        self.post_code + "" + self.address
    end
end
