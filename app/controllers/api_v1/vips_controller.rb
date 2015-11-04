class ApiV1::VipsController < ApiController

  def confirm
    
    if @user

      qrcode = params[:qrcode]
      if Order.find_by_qrcode(qrcode) && Order.find_by_qrcode(qrcode).user == @user
        render :json => { :message => "confirm successfully!" },  :status => 200
      else
        render :json => { :message => "confirm faild!" },  :status => 500
      end

    end

  end

end
