class Record < ApplicationRecord
  belongs_to :user
  has_many :training_records, inverse_of: :record, dependent: :destroy
  accepts_nested_attributes_for :training_records, allow_destroy: true

  validates :comment, presence: true
  validates :start_time, presence: true

end

