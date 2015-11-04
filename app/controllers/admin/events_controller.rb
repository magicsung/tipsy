class Admin::EventsController < ApplicationController

  layout "admin"

  before_action :authenticate_admin
  before_action :find_event, :only => [:show, :edit, :update, :destroy]

  def index
    @event = Event.all
    @event = @event.page(params[:page]).per(10)
  end

  def show
    
  end

  def new
    @event = Event.new
  end

  def create

    @event = Event.new( event_params )

    if @event.save
      flash[:notice] = "Event was successfully created!"
      redirect_to :action => :index
    else
      flash.now[:alert] = "Please enter something!"
      render "new"
    end

  end

  def edit
    
  end

  def update

    if params[:destroy_edm] == "1"
      @event.edm = nil
    end

    if @event.update( event_params )
      flash[:notice] = "Event was updated!"
    end

    redirect_to :action => :index

  end

  def destroy
    @event.destroy
    flash[:notice] = "Event was deleted."
    redirect_to :action => :index
  end


  private

  def event_params
    params.require(:event).permit(:title, :status, :description, :contact, :phone, :city, :address, :start_date, 
                                  :start_time, :due_date, :due_time, :edm, :price, :popular, :store_id, :dj_list => [])
  end

  def find_event
    @event = Event.find(params[:id])
  end

end
