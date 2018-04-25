class HomeController < ApplicationController
  def index
    @products = Product.active
  end
end
