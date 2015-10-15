class Admin::CategoriesController < ApplicationController

  layout "admin"

  before_action :authenticate_admin
  before_action :find_category, :only => [:show, :edit, :update, :destroy]

  def index
    
  end

  def show
    
  end

  def new
    @category = Category.new
  end

  def create

    @category = Category.new( category_params )

    if @category.save
      flash[:notice] = "Category was successfully created!"
      redirect_to :action => :index 
    else
      flash.now[:alert] = "Please enter something!"
      render "new"
    end

  end

  def edit
    
  end

  def update
    
    if params[:destroy_image] == "1"
      @category.image = nil
    end

    if @category.update( category_params )
      flash[:notice] = "Post was updated!"
    end
    redirect_to :action => :index

  end

  def destroy

    @category.destroy
    redirect_to :action => :index

  end



  private

  def category_params
    params.require(:category).permit(:name, :description, :image)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
