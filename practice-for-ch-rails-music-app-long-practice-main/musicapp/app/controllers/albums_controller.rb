class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]

  # GET /albums
  def index
    @albums = Album.all
  end

  # GET /albums/1
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  def create
    @band = Band.find_by(name: params[:album][:band_name])
    @album = Album.new(album_params.except(:band_name).merge!(band_id: @band.id))

    if @album.save
      redirect_to @album, notice: "Album was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    @band = Band.find_by(name: params[:album][:band_name])
    if @album.update(album_params.except(:band_name).merge!(band_id: @band.id))
      redirect_to @album, notice: "Album was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
    redirect_to albums_url, notice: "Album was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:band_name, :title, :year, :live)
    end
end
