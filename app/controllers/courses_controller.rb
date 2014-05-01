class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Course.search(params[:q])
    @courses = @q.result(distinct: true)
  end

  def new
    @course.build_booking    
  end

  def create

    @course = Course.new(params[:course])

    validate_dates

    if @invalid_date_error
      flash.now[:notice] = @invalid_date_error
      render action: "new"
    elsif overlapped_bookings?(@new_start_date, @new_end_date)
      overlap_error = "Course overlaps with #{@overlapped_bookings.length} other courses: "
      overlapped_courses = @overlapped_bookings.map { |booking|
        booking.course.name }
      overlap_error << overlapped_courses.to_sentence
      overlap_error << "."
      flash.now[:notice] = overlap_error
      render action: "new"
    else
      if @course.save
        redirect_to @course, notice: "#{@course.name} has been added."
      else
        render action: "new"
      end
    end
  end

  def show
  end

  def edit
    @course.build_booking
  end

  def update
    validate_dates

    if @invalid_date_error
      flash.now[:notice] = @invalid_date_error
      render action: "edit"
    elsif overlapped_bookings?(@new_start_date, @new_end_date)
      overlap_error = "Course overlaps with: "
      overlapped_courses = @overlapped_bookings.map { |booking|
        booking.course.name }
      overlap_error << overlapped_courses.to_sentence
      overlap_error << "."
      flash.now[:notice] = overlap_error
      render action: "edit"
    else
      if @course.update_attributes(params[:course])
        redirect_to @course, notice: "#{@course.name} has been added."
      else
        render action: "edit"
      end
    end
  end

  def destroy
    Course.destroy(params[:id])
    redirect_to courses_path, notice: "Course has been deleted."
  end

  def overlapped_bookings?(new_start_date, new_end_date)
    @overlapped_bookings = Booking.where("classroom_id = #{params[:course][:booking_attributes][:classroom_id]} and (start_date between '#{new_start_date}' and '#{new_end_date}' or end_date between '#{new_start_date}' and '#{new_end_date}')")

    if @overlapped_bookings && @overlapped_bookings.any?
      true
    else
      false
    end
  end

  def validate_dates
    booking = params[:course][:booking_attributes]
    
    start_year = booking["start_date(1i)"].to_i
    start_month = booking["start_date(2i)"].to_i
    start_day = booking["start_date(3i)"].to_i
    end_year = booking["end_date(1i)"].to_i
    end_month = booking["end_date(2i)"].to_i
    end_day = booking["end_date(3i)"].to_i
    
    if Date.valid_date?(start_year, start_month, start_day) && Date.valid_date?(end_year, end_month, end_day)
      @new_start_date = Date.new(start_year, start_month, start_day)
      @new_end_date = Date.new(end_year, end_month, end_day)
    else
      if !Date.valid_date?(start_year, start_month, start_day)
        invalid_date_error = "Start date is invalid"
      end
      if invalid_date_error && !Date.valid_date?(end_year, end_month, end_day)
        invalid_date_error << " and end date is invalid"
      elsif !Date.valid_date?(end_year, end_month, end_day)
        invalid_date_error = "End date is invalid"
      end
      invalid_date_error << "."
      @invalid_date_error = invalid_date_error
    end
  end

  

end
