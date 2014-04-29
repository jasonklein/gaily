class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student, class_name: "User"
  attr_accessible :paid_deposit, :pre_work, :student_attributes, :course_id, :student_id

  accepts_nested_attributes_for :student
end
