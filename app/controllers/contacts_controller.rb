class ContactsController < ApplicationController

  def create
    @contact = Contact.new( contact_params )

    if @contact.save
      flash[:notice] = "Hi #{@contact.name}, #{'\n'}您的訊息已送出，專人將在24小時內與您聯絡。"
    else
      flash[:alert] = "資料格式錯誤!"
    end
    redirect_to  tipsy_index_path
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :message)
  end

end
