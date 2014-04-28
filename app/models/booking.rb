class Booking < ActiveRecord::Base
  belongs_to :course
  belongs_to :classroom
  attr_accessible :end_date, :start_date, :classroom_attributes

  accepts_nested_attributes_for :classroom
end
