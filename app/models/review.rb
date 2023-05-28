class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rating, presence: true
  validates :comment, length: { minimum: 1, maximum: 100 }
end
