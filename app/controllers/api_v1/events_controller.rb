class ApiV1::EventsController < ApiController

  def index
    @event = Events.all
  end

  def show
    
  end


end
