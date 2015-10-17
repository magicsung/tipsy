class Meetup < ActiveRecord::Base

  has_many :users, :through => :participates, :counter_cache => "join_count"
  has_many :meetup_messages, :dependent => :destroy


end
