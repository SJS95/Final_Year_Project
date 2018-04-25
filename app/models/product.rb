class Product < ApplicationRecord
  has_many :orders
  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%").order('product_id DESC')
    else
      order('product_id DESC')
    end
  end

  def variable_price
    @product = Product.find(params[:id])
    @order_qty = Order.where(:product_id => [@product.id]).sum(:quantity)
  end


  mount_uploader :image, ImageUploader
end
