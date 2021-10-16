class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to public_orders_path
  end

  def thanks
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
  end


  def show
  end


  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
