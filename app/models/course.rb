class Course < ApplicationRecord
  belongs_to :admin
  belongs_to :post, optional: true
  
  validates :course_name, presence: true, length: {maximum: 50 }
  validates :teacher_name, presence: true, length: {maximum: 50 }
  validates :date, presence: true
  validates :status, presence: true, length: {maximum: 50 }
  validates :content, presence: true, length: {maximum: 255 }

  has_many :categories
  
  mount_uploader :photo, PhotoUploader
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :user
end