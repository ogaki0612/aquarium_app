class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :aquas
  has_many :comments

  has_one_attached :image

  with_options presence: true do
    validates :nickname
    validates :profile
    validates :image
  end

end
