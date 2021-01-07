class SellsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit
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

  def edit
    @sell = Sell.find(params[:id])
  end

  def update
    @sell = Sell.find(params[:id])
    if @sell.update(sell_params) # updateメソッドの引数tweet_paramsでは、どの情報を更新するかを指定
      redirect_to sell_path
    else
      render :edit
    end
  end

  private

  def sell_params
    params.require(:sell).permit(:product_name, :product_description, :category_id, :product_condition_id, :delivery_fee_id,
                                 :shipping_area_id, :day_id, :image, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @sell = Sell.find(params[:id])
      unless @sell.user_id == current_user.id
        redirect_to root_path
      end
  end
end
