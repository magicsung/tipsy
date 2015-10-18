class DjController < ApplicationController

  def index
    @dj = Dj.all
  end

  def show
    @dj = Dj.find( params[:id] )
  end

end
