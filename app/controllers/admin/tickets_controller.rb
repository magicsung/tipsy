require 'rqrcode_png'

class Admin::TicketsController < ApplicationController

  layout "admin"

  def index
    @ticket = Ticket.all.valid_ticket
  end

  def show
    
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save!
    redirect_to :back
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :qrcode, :due_time)
  end

end
