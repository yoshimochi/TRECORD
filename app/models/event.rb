class Event < ApplicationRecord
  belongs_to :genre
  has_many :set_events, dependent: :destroy
end
