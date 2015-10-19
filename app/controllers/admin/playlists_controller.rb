class Admin::PlaylistsController < ApplicationController

  layout "admin"

  before_action :authenticate_admin  

  before_action :find_playlist, :only => [ :edit, :update, :destroy ]

  def index
    
  end

  def new
    
  end

  def create
    @dj = params[:dj]
    @playlist = Playlist.new( playlist_params )
    @playlist.djs_id = @dj

    if @playlist.save!
      flash[:notice] = "Playlist was successfully created!"
      redirect_to admin_dj_path(@dj)
    end
  end

  def edit

  end

  def update
    @dj = params[:dj]
    if @playlist.update( playlist_params )
      flash[:notice] = "Post was updated!"
    end
    redirect_to admin_dj_url(@dj)
  end

  def destroy
    @playlist.destroy
    redirect_to :back
  end

  
  private

  def playlist_params
    params.require(:playlist).permit( :title, :content, :dj_id )
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

end
