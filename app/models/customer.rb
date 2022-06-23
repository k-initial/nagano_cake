# == Schema Information
#
# Table name: customers
#
#  id                     :integer          not null, primary key
#  address                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  first_name_kana        :string
#  is_delete              :boolean          default(FALSE), not null
#  last_name              :string
#  last_name_kana         :string
#  phone_number           :string
#  post_code              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true 
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, uniqueness: true

  
  def self.search_for(content,method)
    return none if content.blank?
    if method == 'forward'
    
      f_customer = Customer.where('first_name LIKE ?',content + '%')
      l_customer = Customer.where('last_name LIKE ?',content + '%')
      
      customers = f_customer + l_customer
    elsif method == 'backword'
      Customer.where('first_name LIKE ?', '%' + content)
      f_customer = Customer.where('first_name LIKE ?', '%' + content)
      l_customer = Customer.where('last_name LIKE ?', '%' + content)
      
      customers = f_customer + l_customer
    else
      f_customer = Customer.where('first_name LIKE ?', '%' + content + '%')
      l_customer = Customer.where('last_name LIKE ?', '%' + content + '%')
      
      customers = f_customer + l_customer
    end
  end

  def active_for_authentication?
    super && (self.is_deleted == falsse)
  end
end
