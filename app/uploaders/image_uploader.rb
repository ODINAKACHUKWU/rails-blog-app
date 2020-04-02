class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick support:
  # include CarrierWave::RMagick

  # Include MiniMagick support
  include CarrierWave::MiniMagick

  # Processes for test and development environment
  if Rails.env.test? || Rails.env.development?
    # Directory to be stored on test and development environments
    storage :file
  
    def store_dir
      case model
      when Article
        "uploads/#{model.class.to_s.underscore}-images/" + model.title.parameterize
      when User
        "uploads/#{model.class.to_s.underscore}-images/" + model.id.to_s
      end
    end
  end
  
  # Processes for production environment
  if Rails.env.production?
    include Cloudinary::CarrierWave
  
    def public_id
      case model
      when Article
        'authors-haven/articles/' + model.title.parameterize
      when User
        'authors-haven/users/' + model.id.to_s
      end
    end
  end

  # def resize_image_to_fit(width, height)
  #   process :resize_to_fit => [width, height]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
