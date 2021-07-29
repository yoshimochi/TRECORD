class TrainingRecord < ApplicationRecord
  belongs_to :event
  belongs_to :record
end
