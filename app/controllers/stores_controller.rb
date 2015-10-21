class StoresController < ApplicationController

  before_action :find_store, :only => [ :show ]

  def index
    # if params[:keyword] 
    #   @store = Store.where( [ "name like ?", "%#{params[:keyword]}%" ] )
    # else
    #   @store = Store.all
    # end
    @store = Store.all
    @category = params[:category].to_i

    # @store = @store.page(params[:page]).per(10)
  end

  def show
    
  end


private

  def find_store
    @store = Store.find(params[:id])
  end

end
