class Room < ApplicationRecord
    belongs_to :user
    has_many :bookings

    mount_uploader :room_image, ImageUploader

end
