class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    requestData = Cloudsight::Request.send(locale: 'en', url: "http://res.cloudinary.com/dooq8xjip/image/upload/#{@photo.photo.path}")
    responseData = Cloudsight::Response.get(requestData['token'])
    @photo.description = responseData["name"]
    sleep(4)
    if @photo.description.nil?
      create
    else
      @photo.save
    end
    redirect_to photo_query_beers_path
  end


  private

  def photo_params
    params.require(:photo).permit(:description, :photo)
  end
end
