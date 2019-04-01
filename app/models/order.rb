class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  accepts_nested_attributes_for :order_details

  validates :date, presence: true
  validates :user_id, presence: true

  delegate :name, to: :user, prefix: true

  ORDER_PARAMS = [:user_id, :date, order_details_attributes:
  	[:pet_id, :service_id, :order_id, :price]].freeze

  scope :by_lastest, ->{order created_at: :desc}
end
