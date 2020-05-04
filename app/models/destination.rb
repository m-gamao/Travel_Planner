class Destination < ApplicationRecord
  belongs_to :user
  has_many :notes
  has_many_and_belongs_to :trips, through: user

  accepts_nested_attributes_for :trip
  accepts_nested_attributes_for :notes

  validates :name, presence: true

  # def notes_attributes=(notes_attributes)
	#   Notes_attributes.each do |notes_attributes|
	#     self.notes.build(notes_attributes)
  #   end    
  # end

end