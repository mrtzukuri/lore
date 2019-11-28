class EventPictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
