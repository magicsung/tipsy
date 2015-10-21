class StoresController < ApplicationController

  before_action :find_store, :only => [ :show ]

  def index
    # if params[:keyword] 
    #   @store = Store.where( [ "name like ?", "%#{params[:keyword]}%" ] )
    # else
    #   @store = Store.all
    # end

    @category = params[:category].to_i
    if @category > 1
      @store = Store.where( :category_id => @category )
    else
      @store = Store.all
    end

    # @store = @store.page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
  end


private

  def find_store
    @store = Store.find(params[:id])
  end

end
