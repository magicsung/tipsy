class Admin::DjController < ApplicationController

  layout "admin"

  before_action :authenticate_admin
  before_action :find_dj, :only => [:show, :edit, :update, :destroy]

  def index
    
  end

  def show
    
  end

  def new
    @dj = Dj.new
  end

  def create
    @dj = Dj.new( dj_params )

    if @dj.save
      flash[:notice] = "Store was successfully created!"
      redirect_to :action => :index 
    else
      flash.now[:alert] = "Please enter something!"
      render "new"
    end

  end

  def edit  

  end

  def update

    if params[:destroy_photo] == "1"
      @dj.photo = nil
    end

    if @dj.update( dj_params )
      flash[:notice] = "Post was updated!"
    end
    redirect_to :action => :index
  end

  def destroy
    @dj.destroy
    redirect_to :action => :index
  end



  private

  def dj_params
    params.require(:dj).permit(:name, :description, :photo)
  end

  def find_dj
    @dj = Dj.find(params[:id])
  end

end
