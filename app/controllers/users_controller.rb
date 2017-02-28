class UsersController < ApplicationController

  def index

  end

  def new
    @business = Business.new
    @user = User.new
  end

  def create
    @business = Business.create(company: params[:company], company_field: params[:company_field], phone: params[:phone_bus], address: params[:address])
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :phone)
  end

end
