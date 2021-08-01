class Event < ApplicationRecord
  belongs_to :genre
  belongs_to :event
  has_many :set_events, dependent: :destroy
  accepts_nested_attributes_for :set_events, allow_destroy: true

  # has_many :training_records, dependent: :destroy

end
