class Album < ApplicationRecord
	has_many :photos
	validates :title, presence: true, length: { minimum: 5 }
    mount_uploader :urlimg, ImageUploader
end
