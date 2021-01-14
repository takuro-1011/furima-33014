class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @product_address = ProductAddress.new
    @sell = Sell.find(params[:sell_id])
    redirect_to root_path if current_user == @sell.user || !@sell.product.nil?
  end

  def create
    @sell = Sell.find(params[:sell_id])
    @product_address = ProductAddress.new(product_params)
    if @product_address.valid?
      pay_sell
      @product_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def product_params
    params.require(:product_address).permit(:postal_code, :municipality, :address, :phone_number, :shipping_area_id, :product_id, :building_name).merge(
      user_id: current_user.id, token: params[:token], sell_id: params[:sell_id]
    )
  end

  def pay_sell
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @sell.price,  # 商品の値段
      card: product_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
