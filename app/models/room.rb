class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reserve_rooms

  validates :user_id, :name, :introduction, :price, :address, :image, presence: true
end
