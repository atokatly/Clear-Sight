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
    if request.xhr?
      p "I'm an Ajax call"
      @user = User.find_by(id: session[:user_id])
      render "/tasks/all", layout: false
    else
      @task = Task.find_by(id: params[:id])
      @user = User.find_by(id: @task.user_id)
      @job = Job.find_by(id: params[:job_id])
      @comments = @task.comments.order(created_at: :desc)
      array = []
      @comments.each {|task| array << task.id}
      array
      @answers = Answer.where(comment_id: array)
      p "I'm a standard route"
    end
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
