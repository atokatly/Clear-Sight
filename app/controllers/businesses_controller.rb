class BusinessesController < ApplicationController
  def index
    @business = Business.all
  end

  def new
    @business = Business.new
    @user = User.new
  end

  def create
    if params[:business][:company_field].length != 0 && params[:business][:company].length != 0
      @business = Business.create(company: params[:business][:company], company_field: params[:business][:company_field], phone_bus: params[:business][:phone_bus], address: params[:business][:address])
    end
    business = Business.find_by(company: params[:business][:company])
    @user = User.new(username: params[:business][:users][:username], email: params[:business][:users][:email], password: params[:business][:users][:password], password_confirmation: params[:business][:users][:password_confirmation], f_name: params[:business][:users][:f_name], l_name: params[:business][:users][:l_name], phone: params[:business][:users][:phone], title: params[:business][:users][:title])
    @user.business_id = business.id
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @business = Business.find(params[:id])
  end


  private

  def user_params
    params.require(:business).permit(:users)
  end
end
