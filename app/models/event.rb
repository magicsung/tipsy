class Event < ActiveRecord::Base

  has_many :event_djships
  has_many :djs, :through => :event_djships

  has_attached_file :edm, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :edm, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"
  validates_attachment_content_type :edm, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title

  scope :public_event, -> { where("due_date > (?)", Time.now + 1.day ) }

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
