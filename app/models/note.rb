class Note < ApplicationRecord
  belongs_to :destination, optional: true
 
end
