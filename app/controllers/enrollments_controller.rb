class EnrollmentsController < ApplicationController
  load_and_authorize_resource

  def new
    @enrollment.build_student
    @course = Course.find(params[:course_id])
  end

  def create

    @course = Course.find(params[:course_id])

    if student_already_enrolled?
      flash[:notice] = "Student already enrolled in course."
      render 'new'
    else
      @enrollment = Enrollment.new(params[:enrollment])
      @enrollment.course_id = params[:course_id]
      
      if @enrollment.save
        redirect_to @course, notice: "#{@enrollment.student.full_name} has been added."
      else
        render 'new'
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    Enrollment.delete(params[:id])
    redirect_to course_path(params[:course_id])
  end

  def student_already_enrolled?
    if Enrollment.where(course_id: params[:course_id], student_id: params[:enrollment][:student_id]).any?
      true
    end
  end

end
