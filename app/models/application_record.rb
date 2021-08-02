class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def total_weight(sub)
    (sub.weight * sub.rep / 40) + sub.weight
  end
end
