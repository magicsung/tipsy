class ApiV1::EventsController < ApiController

  def index
    @event = Event.all
  end

  def show
    
  end


end
