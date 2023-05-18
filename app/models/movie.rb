class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["genres_name", "title", "overview"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["genres_name", "title", "overview"]
  end
end
