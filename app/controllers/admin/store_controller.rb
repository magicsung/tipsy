class Admin::StoreController < ApplicationController

  layout "admin"

  before_action :authenticate_admin
  before_action :find_store, :only => [:show, :edit, :update, :destroy]

  def index

    if params[:keyword] 
      @store = Store.where( [ "name like ?", "%#{params[:keyword]}%" ] )
    else
      @store = Store.all
    end

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
    params.require(:store).permit(:name, :category_id, :description, :phone, :location_city, :location_address, :hours, :photo,
                                  :hours_monday, :hours_tuesday, :hours_wensday, :hours_thursday, :hours_friday, :hours_saturday, :hours_sunday)
  end

  def find_store
    @store = Store.find(params[:id])
  end

end
