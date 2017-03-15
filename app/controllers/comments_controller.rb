class CommentsController < ApplicationController

  def index

  end

  def new
    @job = Job.find_by(id: params[:job_id])
    @task = Task.find_by(id: params[:task_id])
    @user = User.find_by(id: session[:user_id])
    @comment = @user.comments.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # redirect_to comment_path(@comment)
      redirect_to job_task_path(@comment.task.job,@comment.task)
    else
      redirect_to new_job_task_comment_path
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    @user = User.find_by(id: @comment.user_id)
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @job = Job.find_by(id: @comment.job_id)
    @task = Task.find_by(id: @comment.task_id)
  end

  def update
    p params
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to job_task_path(@comment.task.job,@comment.task)
    else
      redirect_to edit_comment_path
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @job = @comment.task.job
    @task = @comment.task
    if @comment.destroy
      redirect_to job_task_path(@job, @task)
    else
      @errors = "Unable to destroy comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :task_id, :user_id, :job_id)
  end

end
