class TrainingRecord < ApplicationRecord
  belongs_to :record
  has_many :set_events, dependent: :destroy
  accepts_nested_attributes_for :set_events, allow_destroy: true
end
