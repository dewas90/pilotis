class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.admin_id = current_user.profile.admin
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def update
    @album.update(album_params)
    redirect_to album_path(@album)
  end

  def edit
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  def show
  end

  def index
    @albums = Album.all
  end

private

 def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, photos: [])
  end

end
