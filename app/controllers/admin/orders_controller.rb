class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
    if  @order.update(order_params)
      redirect_to  admin_order_path(order)
    else
      render :show
    end
  end

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
