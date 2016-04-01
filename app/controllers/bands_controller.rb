class BandsController < ApplicationController
  before_action :logged_in_user, only: :show
  before_action :admin_user_only, except: [:index, :show]

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = "band created"
      redirect_to @band
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      flash[:success] = "band updated"
      redirect_to @band
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    Band.find(params[:id]).destroy
    flash[:success] = "band deleted"
    redirect_to root_url
  end

  private
    def band_params
      params.require(:band).permit(:name)
    end
end
