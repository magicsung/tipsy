class StoresController < ApplicationController

  has_many :comments, :dependent => :destroy

  validates_presence_of :name

end
