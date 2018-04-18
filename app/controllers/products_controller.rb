class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:term])
    render text: params
  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new
    @customer = Customer.all
  end

  def new
    @product = Product.new
    render text: params
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
    @product.destroy

    redirect_to products_index_path
  end

  private
  def product_params
    params.require(:product).permit(:product_id, :title, :description, :price, :manufacturer, :model, :brand, :image, :cheaper_target,
                                    :cheaper_price, :cheapest_target, :cheapest_price, :term)
  end
end