class AlbumsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  before_action :admin_user_only, except: [:index, :show]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "album created"
      redirect_to @album
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:success] = "album updated"
      redirect_to @album
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    Album.find(params[:id]).destroy
    flash[:success] = "album deleted"
    redirect_to root_url
  end

  private
    def album_params
      params.require(:album).permit(:alb_t, :name, :band_id)
    end
end
