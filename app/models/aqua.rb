class Aqua < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :logs

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :details
    validates :category_id
  end
  
end
