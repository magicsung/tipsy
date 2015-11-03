class Ticket < ActiveRecord::Base

  belongs_to :user

  scope :valid_ticket, -> { where("due_time > (?)", Time.now ) }

end
