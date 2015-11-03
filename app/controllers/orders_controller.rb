require 'allpay'
class OrdersController < ApplicationController

  def show
    @order = Order.find( params[:id] )
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new_from_cart(current_cart, order_params)
    if @order.save
      current_cart.clear
      redirect_to @order
    else
      render :new
    end
  end

  def checkout
    order = Order.find params[:id]
    trade = order.trades.create!
    allpay = Allpay.new
    @checkout_params = {
      MerchantID: allpay.merchant_id,
      MerchantTradeNo: trade.trade_number,
      MerchantTradeDate: Time.now.strftime('%Y/%m/%d %H:%M:%S'),
      PaymentType: :aio,
      TotalAmount: order.total.round,
      TradeDesc: :'My Cart',
      ItemName: order.line_items.map{ |i| "#{i.product.name} x #{i.quantity}" }.join('#'),
      ChoosePayment: order.payment_method,
      ReturnURL: root_url,
      OrderResultURL: allpay_result_url
  }
    @checkout_params[:CheckMacValue] = allpay.make_mac(@checkout_params)
  end

  private

  def order_params
    params.require(:order).permit( :name, :address, :payment_method )
  end

end
