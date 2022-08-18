class AlbumsController < ApplicationController
  before_action :authorize_admin, only: [:edit,:destroy]
  before_action :authorize_user, except: [:index, :show]
  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Album successfully added!"
      redirect_to albums_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album= Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:name, :genre)
    end

end