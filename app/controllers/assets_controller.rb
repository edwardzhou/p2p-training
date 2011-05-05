class AssetsController < ApplicationController

  def upload_image
    img_uploader = ImageUploader.new
    img_uploader.cache!( params[:imgFile] )
    img_uploader.store!

    render :inline => {:error => 0, :url => img_uploader.url}.to_json
  end

  def browse_images
    image_exts = ['gif', 'png', 'jpeg', 'jpg', 'bmp', 'png']
    root_path = Rails.root.join('public', 'uploads', 'images')
    root_url = "/uploads/images/"

    dirs, files = [], []

    path = params[:path].to_s
    path = "/" if path.empty?

    current_path = File.join(root_path, path)
    current_url = File.join(root_url, path)
    current_dir_path = path
    moveup_dir_path = path.sub( /(.*?)[^\/]+\/$/, '\1' )

    # no .. in the path
    if path =~ /(^\.\.\/)|(\.\.$)|(\/\.\.\/)/
      render :inline => 'Access is not allowed.'
      return
    elsif path !~ /\/$/
      render :inline => 'Paramters is not valid.'
      return
    elsif !File.exists?(current_path) || !File.directory?(current_path)
      render :inline => 'Directory is not exists.'
      return
    elsif !File.readable?(current_path)
      render :inline => 'Access is not allowed.'
      return
    end

    Dir.foreach(current_path).each do |x|
      # skip folder . and ..
      next if x =~ /^(\.|\.\.)$/
      realpath = File.join(current_path, x)
      entry = {}
      entry['filename'] = x
      entry['datetime'] = File.mtime(realpath).strftime('%Y-%m-%d %H:%M:%S')
      if File.directory?( realpath )
        entry['is_dir'] = true
        entry['has_file'] = Dir.entries(realpath).size > 2
        entry['filesize'] = 0
        entry['is_photo'] = true
        entry['filetype'] = ''
        dirs << entry
      else
        entry['is_dir'] = false
        entry['has_file'] = false
        entry['filesize'] = File.size(realpath)
        entry['dir_path'] = ''
        fileext = File.extname(realpath).downcase.sub(/(^\.)/, '')
        entry['is_photo'] = image_exts.include?(fileext)
        entry['filetype'] = fileext
        files << entry
      end
    end

    sort_field = case params[:order].to_s.downcase
                   when 'size'
                     'filesize'
                   when 'type'
                     'filetype'
                   else
                     'filename'
                 end

    dirs.sort!{|x, y| x[sort_field] <=> y[sort_field]}
    files.sort!{|x, y| x[sort_field] <=> y[sort_field]}

    files = [dirs, files].flatten

    result = {}
    result['moveup_dir_path'] = moveup_dir_path
    result['current_dir_path'] = current_dir_path
    result['current_url'] = current_url
    result['total_count'] = files.size
    result['file_list'] = files

    render :inline => result.to_json
  end
end
