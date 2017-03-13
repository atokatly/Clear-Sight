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
    @jobs = @user.jobs 
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id].to_i)
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by(id:params[:id])
    @user.destroy
    session[:user_id] = nil

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :f_name, :l_name, :phone, :title)
  end

end
