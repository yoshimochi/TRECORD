class SetEvent < ApplicationRecord
  belongs_to :training_record

  def max
    (self.weight * self.rep / 40 + weight).round
  end
end
