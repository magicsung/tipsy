require 'allpay'
class OrdersController < ApplicationController

  def show
    @order = Order.find( params[:id] )
  end

  def new

  end

  def create

    @order = current_user.orders.new(order_params)
    @vip = Vip.find( params[:order][:vip_id] )
    @order.price = params[:order][:quantity].to_i * @vip.price.to_i
    @order.store_id = @vip.store.id

    if @order.save
      # redirect to allpay
      redirect_to vips_path
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
    params.require(:order).permit( :store_id, :vip_id, :quantity, :payment_method )
  end


end
