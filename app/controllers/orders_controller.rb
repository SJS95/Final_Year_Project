class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path(@order) }
      else
        format.html { render :new }
      end
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
