class Admin::VipsController < ApplicationController

  layout "admin"

  before_action :find_event, :only => [:show, :edit, :update, :destroy]

  def index
    @vip = Vip.all

    @vip_new = Vip.new
  end

  def create
    @vip = Vip.new(vip_params)

    if @vip.save
      flash[:notice] = "Vip was successfully created!"
      redirect_to :action => :index
    else
      flash.now[:alert] = "Please enter something!"
      render "new"
    end

  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def vip_params
    params.require(:vip).permit(:name, :price, :store_id, :stock, :datetime)
  end

  def find_vip
    @vip = Vip.find(params[:id])
  end

end
