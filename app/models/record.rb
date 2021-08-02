class Record < ApplicationRecord
  belongs_to :user
  has_many :training_records, dependent: :destroy
  accepts_nested_attributes_for :training_records, allow_destroy: true
end
