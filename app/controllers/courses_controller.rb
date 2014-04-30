class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    @course.build_booking    
  end

  def create

    @course = Course.new(params[:course])

    #dates_cannot_overlap_for_same_classroom
    
    if overlapped_bookings?
      flash[:notice] = "Dates cannot overlap."
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
  end

  def update
  end

  def destroy
  end

  def overlapped_bookings?

    booking = params[:course][:booking_attributes]
    
    
    

      new_start_date ||= Date.new booking["start_date(1i)"].to_i, booking["start_date(2i)"].to_i, booking["start_date(3i)"].to_i

      new_end_date ||= Date.new booking["end_date(1i)"].to_i, booking["end_date(2i)"].to_i, booking["end_date(3i)"].to_i

      overlapped_bookings = Booking.where("start_date between '#{new_start_date}' and '#{new_end_date}' or end_date between '#{new_start_date}' and '#{new_end_date}'")

      if overlapped_bookings && overlapped_bookings.any?
        true
      else
        false
      end

    #   Booking.where(classroom_id: booking["classroom_id"].to_i).each do |booking|
    #     if new_start_date == booking.start_date
    #       @result = false
    #       i+= 1
          
    #       break
          
    #     elsif (new_start_date > booking.start_date) && (new_start_date <= booking.end_date)
    #       @result = false
    #       i+= 1
          
    #       break
          
    #     elsif (new_start_date < booking.start_date) && (new_end_date > booking.start_date)
    #       @result = false
    #       i+= 1
    #       raise
    #       break
    #     end
    #   end

    #   @result
    #   raise
    # else
    #   flash[:notice] = "Booking dates are invalid."
    #   render action: "new"
    # end
  end

end
