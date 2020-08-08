class SalesController < ApplicationController
  def index
    @sales = Sale.where(day: Time.new)
    @shops = Shop.all
  end

  def new
    @sale = Sale.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    if @sale.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def sale_params
    params.require(:sale).permit(:image,
                                 :department_id,
                                 :heading,
                                 :info,
                                 :caution,
                                 :day,
                                 :start_time,
                                 :end_time,
                                 :shop_id).merge(shop_id: params[:shop_id])
  end

  def admin_user
    redirect_to redirect_to root_path unless current_user.admin?
  end
end
