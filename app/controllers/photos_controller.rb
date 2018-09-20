class PhotosController < ApplicationController
  # before_action :set_photo, only: [:show, :edit, :update, :destroy
  def index
    @photos = Photo.all
  end

  def show
    set_photo
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    if @photo.save
      flash[:notice] = "Photo was successfully submitted."
      redirect_to photo_path(@photo)
    else
      flash[:notice] = @photo.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    set_photo
  end

  def update
    set_photo
    if @photo.update_attributes(photo_params)
      flash[:notice] = "Your photo has been updated!"
      redirect_to photo_path
    else
      flash[:notice] = @photo.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    set_photo
    @photo.destroy

    redirect_to photos_path
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:description, :image, :user)
    end
end
