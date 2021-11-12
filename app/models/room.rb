class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reserve_rooms
end
