class Course < ApplicationRecord
  belongs_to :admin
  belongs_to :post, optional: true
  
  has_many :categories
  
  mount_uploader :photo, PhotoUploader
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :user
end