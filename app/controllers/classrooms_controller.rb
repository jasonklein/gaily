class ClassroomsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Classroom.search(params[:q])
    @classrooms = @q.result(distinct: true).order(:name)
  end

  def new
  end

  def create
    @classroom = Classroom.new(params[:classroom])
    if @classroom.save
      redirect_to @classroom, notice: "#{@classroom.name} has been added."
    else
      render 'new'
    end
  end

  def show
    @bookings = Booking.where(classroom_id: params[:id])
  end

  def edit
  end

  def update
    if @classroom.update_attributes(params[:classroom])
      redirect_to @classroom, notice: "#{@classroom.name} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    Classroom.destroy(params[:id])
    redirect_to classrooms_path, notice: "Classroom has been removed."
  end
end
