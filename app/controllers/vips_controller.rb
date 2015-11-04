require 'rqrcode_png'
class VipsController < ApplicationController

  def index
    @order = Order.new

    if current_user.orders.exists? && current_user.orders.joins(:trades).where('trades.paid = true')

      order_code = current_user.orders.joins(:trades).where('trades.paid = true').last.qrcode
      # @qrcode = RQRCode::QRCode.new( order_code, :size => 4, :level => :h )
      @qrcode = RQRCode::QRCode.new(order_code).to_img.resize(200, 200).to_data_url

    end
  end

end
