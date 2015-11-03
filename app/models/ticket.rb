class Ticket < ActiveRecord::Base

  belongs_to :user
  belongs_to :order

  scope :valid_ticket, -> { where("due_time > (?)", Time.now ) }

end
