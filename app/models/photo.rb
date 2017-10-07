class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :urlimg, ImageUploader
  is_impressionable :counter_cache => true, :column_name => :viewcount
end