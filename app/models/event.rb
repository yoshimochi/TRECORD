class Event < ApplicationRecord
  belongs_to :genre

  paginates_per 6
end 
