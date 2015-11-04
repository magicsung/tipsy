class VipsController < ApplicationController

  def index
    @order = Order.new
  end

end
