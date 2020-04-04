class Trip < ApplicationRecord
  has_many :destinations
  belongs_to :user
  has_many :locations, through: :destinations
  accepts_nested_attributes_for :destinations

  def destinations_attributes=(destinations_attributes)
	  Destination_attributes.each do |destination_attributes|
	    self.destinations.build(destination_attributes)
  end
end
end


