class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    @course.build_booking    
  end

  def create

    course = Course.new(params[:course])

    #dates_cannot_overlap_for_same_classroom
    validate_dates

    if @invalid_date_error
      flash[:notice] = @invalid_date_error
      render action: "new"
    elsif overlapped_bookings?(@new_start_date, @new_end_date)
      overlapped_courses = @overlapped_bookings.map { |booking| booking.course.name }
      flash[:notice] = "#{course.name} overlaps with #{overlapped_courses.to_sentence}."
      render action: "new"
    else
      if course.save
        redirect_to course, notice: "#{course.name} has been added."
      else
        render action: "new"
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
  end

  def overlapped_bookings?(new_start_date, new_end_date)
    @overlapped_bookings = Booking.where("start_date between '#{new_start_date}' and '#{new_end_date}' or end_date between '#{new_start_date}' and '#{new_end_date}'")

    if @overlapped_bookings && @overlapped_bookings.any?
      true
    else
      false
    end
  end

  def validate_dates
    booking = params[:course][:booking_attributes]
    # new_start_date = booking["start_date(1i)"].to_i, booking["start_date(2i)"].to_i, booking["start_date(3i)"].to_i
    # new_end_date = booking["end_date(1i)"].to_i, booking["end_date(2i)"].to_i, booking["end_date(3i)"].to_i

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
