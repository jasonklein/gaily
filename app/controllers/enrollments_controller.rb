class EnrollmentsController < ApplicationController
  load_and_authorize_resource

  def new
    @enrollment.build_student
    @course = Course.find(params[:course_id])
  end

  def create
    @enrollment = Enrollment.new(params[:enrollment])
    @enrollment.course_id = params[:course_id]
    @course = Course.find(params[:course_id])
    
    if @enrollment.save
      redirect_to @course, notice: "#{@enrollment.student.full_name} has been added."
    else
      render 'new'
    end
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
