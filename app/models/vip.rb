class Vip < ActiveRecord::Base

  belongs_to :store
  has_many :orders

end
