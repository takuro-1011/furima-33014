class SellsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_sell, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :destroy]
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
  end

  def edit
  end

  def update
    if @sell.update(sell_params) # updateメソッドの引数tweet_paramsでは、どの情報を更新するかを指定
      redirect_to sell_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @sell.destroy
  end

  private

  def sell_params
    params.require(:sell).permit(:product_name, :product_description, :category_id, :product_condition_id, :delivery_fee_id,
                                 :shipping_area_id, :day_id, :image, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in?
      if @sell.user_id != current_user.id || @sell.product != nil
        redirect_to root_path
      end
    end
  end

  def set_sell
    @sell = Sell.find(params[:id])
  end
end
