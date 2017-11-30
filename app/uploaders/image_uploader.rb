class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # 固定宽度和高度
  # xs - 200x200
  # sm - 400x400
  # md - 600x600
  # lg - 800x800

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :xs do
    process resize_to_fit: [200, 200]
  end

  version :sm do
    process resize_to_fit: [400, 400]

    # 改变 version 格式之后，要同时修改 image_url :version 辅助方法，不然默认格式仍然是 original_file 的 extension
    # 包括删除 model 时调用的 hook 也只会去找原有的 extension
    # 具体操作方法以后在研究
    # process :convert => 'png'
  end

  version :md do
    process resize_to_fit: [600, 600]
  end

  version :lg do
    process resize_to_fit: [800, 800]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    # "something.jpg" if original_filename
    "#{random_filename}.#{file.extension.downcase}"
  end

  private

  def random_filename
    model.image_filename || model.image_filename = SecureRandom.hex(10)
  end

end
