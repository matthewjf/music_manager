class TracksController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user_only, except: [:index, :show]

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
    @note = Note.new
    @note.track_id = params[:id]
    @note.user_id = current_user.id
  end

  def new
    @track = Track.new
    @track.album_id = params[:album_id]
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:success] = "track created"
      redirect_to @track
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      flash[:success] = "track updated"
      redirect_to @track
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    Track.find(params[:id]).destroy
    flash[:success] = "track deleted"
    redirect_to root_url
  end

  private
    def track_params
      params.require(:track).permit(:track_t, :name, :album_id, :lyrics)
    end
end
