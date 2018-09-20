class PhotosController < ApplicationController
  # before_action :set_photo, only: [:show, :edit, :update, :destroy
  def index
    @photos = Photo.all
  end
end
