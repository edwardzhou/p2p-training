class AssetsController < ApplicationController

  def upload_image
    img_uploader = ImageUploader.new
    img_uploader.cache!( params[:imgFile] )
    img_uploader.store!

    render :inline => {:error => 0, :url => img_uploader.url}.to_json
  end

  def browse_images
    root_path = Rails.public_path.join('uploads')
    #root_url = ActionView::Helpers::AssetTagHelper

  end

end
