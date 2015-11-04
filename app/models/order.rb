class Order < ActiveRecord::Base

  has_many :trades
  has_one :ticket
  belongs_to :user

  def paid?
    !!trades.find_by(paid: true)
  end

end
