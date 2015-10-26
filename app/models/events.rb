class Events < ActiveRecord::Base

  has_attached_file :edm, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :edm, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title
  

  def event_image
    abs_url + self.edm.url
  end

  def abs_url
    return "http://www.pa9.club"
  end

end
