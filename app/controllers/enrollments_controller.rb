class EnrollmentsController < ApplicationController
  load_and_authorize_resource

  def new
    @enrollment.build_student
    @course = Course.find(params[:course_id])
  end

  def create
    raise
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
