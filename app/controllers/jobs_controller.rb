class JobsController < ApplicationController

  def index
    @jobs = Job.paginate(page: params[:page], per_page: 15).order('created_at DESC')
  end

  def new
    @user = User.find_by(id: session[:user_id])
    @job = @user.jobs.new

  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      redirect_to new_job_path
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @job = Job.find(params[:id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
    @job = Job.find_by(id: params[:id])
  end

  def update
    @job = Job.find_by(id: params[:id].to_i)
    if @job.update(job_params)

      redirect_to job_path(@job)
    else
      redirect_to new_job(@job)
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    @job = Job.find_by(id: params[:id])
    @job.destroy

    redirect_to user_path(@user)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :address, :company_field, :user_id)
  end

end
