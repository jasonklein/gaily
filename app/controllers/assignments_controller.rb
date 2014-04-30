class AssignmentsController < ApplicationController
  load_and_authorize_resource

  def new
    @assignment.build_instructor
    @course = Course.find(params[:course_id])
  end

  def create

    @course = Course.find(params[:course_id])

    if instructor_already_assigned?
      flash[:notice] = "Instructor already assigned to #{@course.name}."
      redirect_to action: 'new'
    elsif instructor_position_already_assigned?
      flash[:notice] = "Position already assigned."
      redirect_to @course
    else
      @assignment = Assignment.new(params[:assignment])
      @assignment.course_id = params[:course_id]
      
      if @assignment.save
        redirect_to @course, notice: "#{@assignment.instructor.full_name} has been added."
      else
        render "new"
      end
    end
  end

  def edit
    @course = Course.find(params[:course_id])
  end

  def update
    @course = Course.find(params[:course_id])

    if instructor_position_already_assigned?
      flash[:notice] = "Position already assigned."
      render 'edit'
    elsif @assignment.update_attributes(params[:assignment])
        redirect_to @course, notice: "#{@assignment.instructor.full_name}'s assignment has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    Assignment.destroy(params[:id])
    redirect_to course_path(params[:course_id]), notice: "Instructor has been dropped from this course."
  end

  def instructor_already_assigned?
    if Assignment.where(course_id: params[:course_id], instructor_id: params[:assignment][:instructor_id]).any?
      true
    end
  end

  def instructor_position_already_assigned?
    if Assignment.where("course_id = #{params[:course_id]} AND position = '#{params[:assignment][:position]}' AND instructor_id != #{@assignment.instructor_id}").any?
      true
    end
  end

end