class UsersController < ApplicationController
load_and_authorize_resource

  def index
    @students = User.where(role: :student).order(:last_name)
    @instructors = User.where(role: :instructor).order(:last_name)
    @admins = User.where(role: :admin).order(:last_name)
  end

  def new
  end

  def create
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
