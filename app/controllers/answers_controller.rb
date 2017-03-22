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

  end

  def update

  end

  def destroy

  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :comment_id, :answer)
  end

end
