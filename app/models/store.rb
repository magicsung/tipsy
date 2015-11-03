class Store < ActiveRecord::Base

  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :vips

  validates_presence_of :name

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
