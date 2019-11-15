class SpaceAttachment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :space
end
