class Statement < ApplicationRecord
  belongs_to  :leader

  validates_presence_of :leader, :statement, :status
end
