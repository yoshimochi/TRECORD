class Record < ApplicationRecord
  belongs_to :user
  has_many :training_records, dependent: :destroy
  has_many :set_events
end
