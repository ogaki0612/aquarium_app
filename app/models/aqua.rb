class Aqua < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :category

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :details
  end
  validates :category_id, numericality: { other_than: 0 }
end
