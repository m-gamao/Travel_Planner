class Destination < ApplicationRecord
  belongs_to :trip, optional: true
  belongs_to :user
  has_many :notes
  has_many :users, through: :trips

  accepts_nested_attributes_for :trip

  #This is my join table associations
  has_many :trips, through: destination_trip

  validates :name, presence: true
  
  accepts_nested_attributes_for :notes

  # def notes_attributes=(notes_attributes)
	#   Notes_attributes.each do |notes_attributes|
	#     self.notes.build(notes_attributes)
  #   end    
  # end

end