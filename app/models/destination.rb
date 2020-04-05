class Destination < ApplicationRecord
  belongs_to :trip, optional: true
  belongs_to :user
  has_many :notes
end
