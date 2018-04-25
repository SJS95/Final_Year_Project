class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  # has_many :products

  def self.generate_order_number
    ["CGB", Date.today.jd.to_s, (Order.count + 1)].join(":")
  end
end
