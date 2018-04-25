module HomeHelper
  def current_order_total(product_id)
    Order.where(product_id: product_id).sum(:quantity)
  end
end