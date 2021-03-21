class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :aquas
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :profile
  end

end
