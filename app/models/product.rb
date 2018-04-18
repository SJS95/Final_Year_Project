class Product < ApplicationRecord
  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%").order('product_id DESC')
    else
      order('product_id DESC')
    end
  end


  mount_uploader :image, ImageUploader
end
