class Booking < ActiveRecord::Base
  belongs_to :course
  belongs_to :classroom
  attr_accessible :end_date, :start_date, :classroom_attributes, :course_id, :classroom_id

  validates :course_id, uniqueness: true
  validates_date :start_date, on_or_after: :today, on_or_after_message: "must start today or later"
  validates_date :end_date, on_or_after: :start_date, on_or_after_message: "must end after start date"

  accepts_nested_attributes_for :classroom

  

end
