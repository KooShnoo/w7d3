class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def set_band
    @band = Band.find_by(id: params[:id])
  end

  def index
  end

  def create
    @band = Band.new(band_params)
    p 'making a band!! maybe..'
    p band_params, @band
    if @band.save
      redirect_to :bands
    else
      redirect_to :new_band
    end
  end

  def new
    @band = Band.new
  end

  def edit

  end

  def show
  end

  def update
    if @band.save
      redirect_to :bands
    else
      redirect_to :edit_band
    end
  end

  def destroy
    @band.delete!
    redirect_to :bands
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
