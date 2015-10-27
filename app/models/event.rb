class Event < ActiveRecord::Base

  has_many :event_djships
  has_many :djs, :through => :event_djships

  has_attached_file :edm, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :edm, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title

  scope :public_event, -> { where("due_date > (?)", Time.now) }

  def dj_list
    self.djs.map{ |x| x.name }
  end

  def dj_list=(arr)
    arr.delete_if{ |x| x.blank? }

    self.djs = arr.map do |t|
      tag = Djs.find(t)
    end

  end


end
