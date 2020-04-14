class Note < ApplicationRecord
  belongs_to :destination, optional: true

  def self.most_recent(destination)
    self.where(destination_id: destination.id).order(created_at: :desc).limit(3)
  end
  
end
