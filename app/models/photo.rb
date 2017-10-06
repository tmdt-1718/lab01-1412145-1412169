class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :urlimg, ImageUploader
end
