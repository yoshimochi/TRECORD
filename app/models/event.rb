class Event < ApplicationRecord
  belongs_to :genre
  validates :name, presence: true, uniqueness: true
  paginates_per 6
end
