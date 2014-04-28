class Course < ActiveRecord::Base
  attr_accessible :description, :end_time, :name, :start_time

  has_one :booking
  has_one :classroom, through: booking
end
