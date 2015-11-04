class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates_presence_of :name

  has_many :meetup_messages
  has_many :meetup, :through => :participates
  has_many :participates
  has_many :tickets
  has_many :orders

  before_create :generate_authentication_token

  def self.get_fb_data(access_token)
    res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token } }

    if res.code == 200
      JSON.parse( res.to_str )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end

  def admin?
    self.role == "admin"
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_uid( auth.uid )
    if user
      user.token = auth.credentials.token
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.uid = auth.uid
      existing_user.token = auth.credentials.token
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.uid = auth.uid
    user.token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.image = auth.info.image
    user.save!
    return user
  end

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end

end
