class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  attr_accessor :current_password
  mount_uploader :image, ImageUploader

  has_many :rooms, dependent: :destroy
  has_many :bookings, dependent: :destroy

end
