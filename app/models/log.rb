class Log < ApplicationRecord
  belongs_to :aqua

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
  end
end
