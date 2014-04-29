class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    @course.build_booking    
  end

  def create
    
    @course = Course.new(params[:course])

    if @course.save
      redirect_to @course, notice: "#{@course.name} has been added."
    else
      render action: "new"
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
