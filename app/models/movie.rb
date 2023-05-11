class Movie < ApplicationRecord
  validates :admin, presence: true
  belongs_to :admin
  has_many :reviews
  has_many :favorites
end
