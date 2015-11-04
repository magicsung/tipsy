require 'rqrcode_png'
class VipsController < ApplicationController

  def index
    @order = Order.new

    if current_user && current_user.orders.exists? && current_user.orders.joins(:trades).where('trades.paid = true').exists?

      order = current_user.orders.joins(:trades).where('trades.paid = true').last
      # @qrcode = RQRCode::QRCode.new( order, :size => 4, :level => :h )
      @order_info = order
      @qrcode = RQRCode::QRCode.new(order.qrcode).to_img.resize(200, 200).to_data_url
      
    end
  end

end
