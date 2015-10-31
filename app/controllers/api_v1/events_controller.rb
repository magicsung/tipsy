class ApiV1::EventsController < ApiController

  def index
    if :authenticate_api_token?
      @event = Event.all.public_event
    end
  end

  def show
    
  end


end
