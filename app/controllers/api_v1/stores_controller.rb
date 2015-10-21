class ApiV1::StoresController < ApiController

  def index
    @store = Store.all
  end

  def show
    
  end

end
