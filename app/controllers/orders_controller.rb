class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    # @customer = Customer.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :product_id, :order_date, :quantity)
  end
end
