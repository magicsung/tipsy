class Participate < ActiveRecord::Base

  belongs_to :meetup
  belongs_to :user

end
