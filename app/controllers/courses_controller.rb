class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    @course.build_booking    
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
