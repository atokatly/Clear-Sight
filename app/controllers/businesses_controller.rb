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
    if params[:business][:users][:company] == ""
      business = Business.find_by(company: params[:business][:company])
      @user = User.new(username: params[:business][:users][:username], email: params[:business][:users][:email], password: params[:business][:users][:password], password_confirmation: params[:business][:users][:password_confirmation], f_name: params[:business][:users][:f_name], l_name: params[:business][:users][:l_name], phone: params[:business][:users][:phone], title: params[:business][:users][:title], business_id: business.id)
    else
      @user = User.new(username: params[:business][:users][:username], email: params[:business][:users][:email], password: params[:business][:users][:password], password_confirmation: params[:business][:users][:password_confirmation], f_name: params[:business][:users][:f_name], l_name: params[:business][:users][:l_name], phone: params[:business][:users][:phone], title: params[:business][:users][:title], business_id: params[:business][:users][:company])
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @business = Business.find_by(id: params[:id])
    # Refactor and use code below to limit calls to db at scale
    # @user = User.find(id).includes(:posts => :comments)
    @users = @business.users
    # Refactor to have a class method handle this
    array = []
    @users.each {|user| array << user.id}
    @tasks = Task.where(user_id: array)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:business).permit(:users)
  end
end
