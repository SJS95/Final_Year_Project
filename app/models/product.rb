class Product < ApplicationRecord
  has_many :orders

  scope :active, -> { where(active: true) }

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%").order('product_id DESC')
    else
      order('product_id DESC')
    end
  end

  def variable_price
    order_qty = Order.where(product_id: self.id).sum(:quantity)

    if order_qty < self.cheaper_target
      best_price = self.price
    elsif order_qty >= self.cheaper_target && order_qty < self.cheapest_target
      best_price = self.cheaper_price
    else
      best_price = self.cheapest_price
    end

    return best_price
  end


  mount_uploader :image, ImageUploader
end
