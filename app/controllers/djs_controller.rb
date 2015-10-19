class DjsController < ApplicationController

  def index
    @dj = Djs.all
  end

  def show
    @dj = Djs.find( params[:id] )
  end

end
