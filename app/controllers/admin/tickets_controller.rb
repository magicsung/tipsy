require 'rqrcode_png'

class Admin::TicketsController < ApplicationController

  layout "admin"

  def index
    @ticket = Ticket.all
  end

  def show
    
  end

  def new
    
  end

  def create
    
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

end
