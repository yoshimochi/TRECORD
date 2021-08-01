class Record < ApplicationRecord
  belongs_to :user
  has_many :training_records, dependent: :destroy
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, allow_destroy: true
end
