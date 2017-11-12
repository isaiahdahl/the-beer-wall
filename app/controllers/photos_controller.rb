class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    # Cloudsight.oauth_options{
    #     consumer_key: 'fu0H4dTcL2sS0J1pwtsJ7Q',
    #     consumer_secret: '4fJ1ZYaRQNrr3W3LTSgQdQ'
    # }
    # Cloudsight.api_key = 'fu0H4dTcL2sS0J1pwtsJ7Q'
    requestData = Cloudsight::Request.send(locale: 'en', url: "http://res.cloudinary.com/dooq8xjip/image/upload/#{@photo.photo.path}")
    responseData = Cloudsight::Response.get(requestData['token'])
    @photo.description = responseData["name"]
    sleep(2)
    @photo.save
    redirect_to photo_query_beers_path
  end

  def sight
    requestData = Cloudsight::Request.send(locale: 'en', file: File.open(params[:file]))
    responseData = Cloudsight::Response.get(requestData['token'])
    p responseData
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :photo)
  end
end
