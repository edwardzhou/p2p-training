#encoding: utf-8

ActiveAdmin.register Album do

  show :title => :name do
    panel "照片" do
      render :partial => "photos",:locals => {:photos => album.photos.order('image')}
      #album.photos.each do |photo|
      #  div :for => photo do
      #    img :src => photo.image_url(:thumb).to_s
      #    br
      #    span photo.description
      #  end
      #end
    end
    active_admin_comments
  end

  sidebar "相册", :only => :show do
    attributes_table_for album, :campaign, :name, :description
  end

end
