class Booking < ActiveRecord::Base
  belongs_to :course
  belongs_to :classroom
  attr_accessible :end_date, :start_date
end
