class Destination < ApplicationRecord
  belongs_to :user

  has_many :notes
  has_many :trip_destinations
  has_many :trips, through: :trip_destinations

  #Create scope methods using SQL concepts and call the methods in 'views/home/index.html.erb:'
  scope :longest_destination, -> { order('length(name) desc').limit(1) }
  scope :shortest_destination, -> { order('length(name) asc').limit(1) }

  accepts_nested_attributes_for :notes

  validates :name, presence: true

end
  # def notes_attributes=(notes_attributes)
	#   Notes_attributes.each do |notes_attributes|
	#     self.notes.build(notes_attributes)
  #   end    
  # end




# # works too:
# Participant.order("MAX(CHAR_LENGTH(first_name)) desc").first

# # and this is the most efficient to get the field directly:
# Participant.limit(1).order("MAX(CHAR_LENGTH(first_name)) desc").pluck(:first_name)

  #Nesting is only used if you want to nest something in a FORM.