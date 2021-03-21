class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :aqua

  validates :text, presence: true
end
