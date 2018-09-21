class PhotosController < ApplicationController
  before_action :authorize_user

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
    @photo.date = Date.current

    if !one_photo_per_day.nil?
      flash.now[:notice] = "You can only submit one photo per day"
      render :new
      return
    end

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
    def authorize_user
      if !user_signed_in?
        flash[:notice] = "You do not have access to this page.  Please sign up or sign in."
        redirect_to root_path
      end
    end

    def one_photo_per_day
      Photo.find_by(
        user_id: current_user,
        date: Date.current
      )
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:description, :image, :user, :date)
    end
end
