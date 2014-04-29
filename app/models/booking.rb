class Booking < ActiveRecord::Base
  belongs_to :course
  belongs_to :classroom
  attr_accessible :end_date, :start_date, :classroom_attributes, :course_id, :classroom_id

  # def dates_cannot_be_in_the_past
  #   if :start_date < Date.today || :end_date < Date.today
  #     errors.add("start/end dates can't be in the past")
  #   end
  # end

  validates :course_id, uniqueness: true
  validates_date :start_date, on_or_after: :today
  validates_date :end_date, on_or_after: :start_date
  accepts_nested_attributes_for :classroom
end
