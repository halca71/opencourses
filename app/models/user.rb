class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: {maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :course
  
  def favorite(course)
    self.favorites.find_or_create_by(course_id: course.id)
  end
  
  def unfavorite(course)
    favorite = self.favorites.find_by(course_id: course.id)
    favorite.destroy if favorite
  end
  
  def likes?(course)
    self.likes.include?(course)
  end

end
