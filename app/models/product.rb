class Product < ApplicationRecord
  has_many :orders
  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%").order('product_id DESC')
    else
      order('product_id DESC')
    end
  end


  mount_uploader :image, ImageUploader
end
