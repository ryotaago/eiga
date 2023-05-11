class Review < ApplicationRecord
  belongs_to :movie
  has_many :comments
end
