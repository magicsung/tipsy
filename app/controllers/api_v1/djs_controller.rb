class ApiV1::DjsController < ApiController

  def index
    
  end

  def show
    @dj = Djs.find(params[:id])
  end

end
