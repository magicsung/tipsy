class Store < ActiveRecord::Base

  belongs_to :category
  has_many :comments, :dependent => :destroy

  validates_presence_of :name

end
