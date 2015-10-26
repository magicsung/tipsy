class EventDjship < ActiveRecord::Base

  belongs_to :djs
  belongs_to :event

end
