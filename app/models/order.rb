class Order < ActiveRecord::Base

  has_many :trades
  belongs_to :user
  belongs_to :vip

  def paid?
    !!trades.find_by(paid: true)
  end

end
