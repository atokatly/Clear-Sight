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
      redirect_to comment_path(@comment)
    else
      redirect_to new_job_task_comment_path
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    @user = User.find_by(id: @comment.user_id)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :task_id, :user_id, :job_id)
  end

end
