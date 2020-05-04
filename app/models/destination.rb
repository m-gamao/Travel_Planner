class Destination < ApplicationRecord
  belongs_to :user
  # belongs_to :trip
  has_many :notes

  has_many :trip_destinations
  has_many :trips, through: :trip_destinations

  #Nesting is only used if you want to nest something in a FORM.
  accepts_nested_attributes_for :notes

  validates :name, presence: true

  # def notes_attributes=(notes_attributes)
	#   Notes_attributes.each do |notes_attributes|
	#     self.notes.build(notes_attributes)
  #   end    
  # end

end