class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :content, presence: true, length: { minimum: 30 }
end
