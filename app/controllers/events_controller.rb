class EventsController < ApplicationController

  def index
    @event = Events.all
  end

  def show
    @event = Events.find(params[:id])
  end

end
