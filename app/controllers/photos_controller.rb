class PhotosController < ApplicationController
  # before_action :set_photo, only: [:show, :edit, :update, :destroy
  def index
    @photos = Photo.all
  end

  def show
    set_photo
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end
end
