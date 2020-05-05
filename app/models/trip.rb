class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  has_many :notes, through: :destinations
  
  accepts_nested_attributes_for :destinations
  
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def destinations_attributes=(destinations_attributes)
	  Destination_attributes.each do |destination_attributes|
	    self.destinations.build(destination_attributes)
    end
  end
end


