class Admin::StoreController < ApplicationController

  layout "admin"

  before_action :authenticate_admin
  before_action :find_store, :only => [:show, :edit, :update, :destroy]

  def index
    @store = Store.all
    @store = @store.page(params[:page]).per(10)
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
    if @store.update( store_params )
      flash[:notice] = "Store was updated!"
    end
    redirect_to :action => :index  
  end

  def destroy
    @store.destroy
    redirect_to :action => :index
  end


  private

  def store_params
    params.require(:store).permit(:name, :description, :phone, :location_city, :location_address, :hours)
  end

  def find_store
    @store = Store.find(params[:id])
  end

end
