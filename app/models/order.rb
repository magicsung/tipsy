class Order < ActiveRecord::Base

  has_many :trades

  def paid?
    !!trades.find_by(paid: true)
  end

end
