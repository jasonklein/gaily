class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :instructor, class_name: "User"
  attr_accessible :contract_fee, :position, :instructor_attributes, :course_id, :instructor_id

  accepts_nested_attributes_for :instructor
end
