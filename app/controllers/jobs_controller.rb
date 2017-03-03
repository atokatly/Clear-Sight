class JobsController < ApplicationController

  def index
    @jobs = Job.paginate(page: params[:page], per_page: 15).order('created_at DESC')
  end

  def show
    @jobs = Job.find(params[:id])
  end

end
