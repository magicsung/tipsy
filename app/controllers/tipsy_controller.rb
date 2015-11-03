require 'rqrcode_png'

class TipsyController < ApplicationController

  def index

  end

  def profile

    if current_user.tickets.exists?

      @ticket = Ticket.where(user_id:current_user)
      @ticket.each do |x|
        @code = x.qrcode
      end

      @qr = RQRCode::QRCode.new(@code).to_img.resize(200, 200).to_data_url

    end
    
  end

end
