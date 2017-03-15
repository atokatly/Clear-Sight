class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @job = Job.find_by(id: params[:job_id])
    @task = @job.tasks.build
  end

  def create
    @job = Job.find_by(id: params[:job_id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to job_task_path(@job, @task)
    else
      redirect_to new_job_task_path
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
    @user = User.find_by(id: @task.user_id)
    @job = Job.find_by(id: params[:job_id])
    @comments = @task.comments
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def task_params
      params.require(:task).permit(:title, :description, :user_id, :job_id)
  end
end
