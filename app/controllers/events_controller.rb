class EventsController < ApplicationController

  def index
    @event = Event.all.public_event
  end

  def show
    @event = Event.find(params[:id])
  end

end
