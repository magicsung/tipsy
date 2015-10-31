class ApiV1::EventsController < ApiController

  def index
    @event = Event.all.public_event
  end

  def show
    
  end


end
