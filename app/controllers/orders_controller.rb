class OrdersController < ApplicationController
  def index
    @customer = current_customer
    @order = current_customer
  end
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        @order.update_attributes(order_number: Order.generate_order_number)
        format.html { redirect_to orders_path(@order) }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @order = current_customer.orders
    # @product = current_customer.find(params[:product][:product_id])
    @customer = current_customer
  end

  def new
    @order = Order.new
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :product_id, :order_date, :quantity, :order_number)
  end
end
