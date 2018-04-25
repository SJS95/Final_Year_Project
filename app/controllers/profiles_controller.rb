class ProfilesController < ApplicationController
  def index
    @customer = current_customer
    @orders = @customer.orders
  end
end