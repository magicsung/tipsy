class Admin::StoreController < ApplicationController
  layout "admin"

  before_action :authenticate_admin

  def index
    
  end

  def show
    
  end

  def new
    @store = Store.new
  end

  def create

    @store = Store.new( store_params )

    if @store.save
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
    
  end

  def destroy
    
  end


  private

  def store_params
    params.require(:store).permit(:name, :description)
  end

end
