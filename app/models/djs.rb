class Djs < ActiveRecord::Base

  has_many :playlists
  has_many :event_djships
  has_many :events, :through => :event_djships

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :photo, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
