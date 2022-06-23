class Order < ApplicationRecord
  belongs_to :customer
	  has_many :order_details, dependent: :destroy
	
	  validates :customer_id, :address, :name, :total_payment, :payment_method, presence: true
	  validates :post_code, length: {is: 7}, numericality: { only_integer: true }
    
    enum payment_method: {"クレジットカード": 0, "銀行振込": 1}
end
