class ApiV1::CommentsController < ApiController

  def index
    render :json => { :message => "Right comment path!!" },  :status => 200    
  end

  def create
    @comment = Comment.new( :rating => params[:rating], :content => params[:content], :store_id => params[:store_id] )
    @comment.user_id = @user.id
    @score = params[:rating].to_i

    if @score >= 5
      @score = 5
    elsif @score <= 0
      @score = 0
    end
    @comment.rating = @score

    if @comment.save
      render :json => { :message => "Comment successfully.", :id => @comment.id  },  :status => 200
    else
      render :json => { :message => "Wrong format!" },  :status => 500
    end
  end

  def destroy
    @comment = Comment.find( params[:id] )
    if @comment.user == @user
      @comment.destroy
      render :json => { :message => "Comment deleted.", :id => @comment.id  },  :status => 200
    else
      render :json => { :message => "Permission denied!" },  :status => 500
    end
    
  end

end
