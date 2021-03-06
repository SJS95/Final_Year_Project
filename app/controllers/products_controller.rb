class ProductsController < ApplicationController
  def index
    @products = Product.active.search(params[:term])
  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new
    @customer = current_customer
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.update_attributes(active: false)

    redirect_to home_index_path
  end



  private
  def product_params
    params.require(:product).permit(:product_id, :customer_id, :title, :description, :price, :manufacturer, :model, :brand, :image, :cheaper_target,
                                    :cheaper_price, :cheapest_target, :cheapest_price, :term, :product_end_date)
  end
end