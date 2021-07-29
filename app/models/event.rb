class Event < ApplicationRecord
  belongs_to :genre
  has_many :set_events, dependent: :destroy
  has_many :training_records, dependent: :destroy

end
