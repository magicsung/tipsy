class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @comment = Comment.new( comment_params )
    @comment.user_id = current_user.id
    @score = params[:score].to_i

    if @score >= 5
      @score = 5
    elsif @score <= 0
      @score = 0
    end
    @comment.rating = @score

    if @comment.save
      redirect_to store_path( params[:comment][:store_id] )
    else
      flash.now[:alert] = "Please enter something!"
      render "new"
    end
    
  end

  def destroy
    @comment = Comment.find( params[:id] )
    if @comment.user == current_user
      @comment.destroy
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit( :rating, :content, :store_id )
  end

end
