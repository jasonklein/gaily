class ClassroomsController < ApplicationController
  load_and_authorize_resource

  def index
    @classrooms = Classroom.order(:name)
  end

  def new
  end

  def create
  end

  def show
    @bookings = Booking.where(classroom_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
