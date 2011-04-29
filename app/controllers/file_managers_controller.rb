class FileManagersController < ApplicationController

  def upload_image
    imgUploader = ImageUploader.new
    imgUploader.cache!( params[:imgFile] )
    imgUploader.store!

    render :inline => {:error => 0, :url => imgUploader.url}.to_json
  end



end
