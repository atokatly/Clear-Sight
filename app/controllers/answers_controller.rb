class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to job_task_path(@answer.comment.task.job, @answer.comment.task)
    else
      redirect_to new_answer_path
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    @answer = Answer.find_by(id: params[:id])
    if @answer.update(answer_params)
      redirect_to job_task_path(@answer.comment.task.job, @answer.comment.task)
    else
      redirect_to edit_answer_path
    end
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    if @answer.destroy
      redirect_to job_task_path(@answer.comment.task.job, @answer.comment.task)
    else
      @errors = "Failed to delete answer"
      redirect_to job_task_path(@answer.comment.task.job, @answer.comment.task)
    end 
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :comment_id, :answer)
  end

end
