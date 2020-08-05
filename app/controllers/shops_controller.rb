class ShopsController < ApplicationController
  # before_action :sign_in, only: [:index, :new, :create]
  # before_action :admin_user, except: [:index]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      redirect_to shops_path
    else
      render :edit
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shops_path
    else
      render :edit
    end
  end

  def shop_params
    params.require(:shop).permit(:company_name,
                                 :shop_name,
                                 :postal_code,
                                 :prefecture_id,
                                 :address,
                                 :tell,
                                 :business_hour,
                                 :image).merge(user_id: current_user.id)
  end

  private

  def sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
