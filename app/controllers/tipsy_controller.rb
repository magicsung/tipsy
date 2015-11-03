require 'rqrcode_png'

class TipsyController < ApplicationController

  def index

  end

  def profile

    @ticket = Ticket.where(user_id:current_user)
    @ticket.each do |x|
      @code = x.qrcode
    end

    # secure = "b03fb6cb9bd4db23082730e2656ce00e3423227f"
    @qr = RQRCode::QRCode.new(@code).to_img.resize(200, 200).to_data_url
  end

end
