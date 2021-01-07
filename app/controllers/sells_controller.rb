class SellsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @sells = Sell.order('created_at DESC')
  end

  def new
    @sell = Sell.new
  end

  def create
    @sell = Sell.new(sell_params)
    if @sell.valid?
      @sell.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @sell = Sell.find(params[:id])
  end

  private

  def sell_params
    params.require(:sell).permit(:product_name, :product_description, :category_id, :product_condition_id, :delivery_fee_id,
                                 :shipping_area_id, :day_id, :image, :price).merge(user_id: current_user.id)
  end
end
