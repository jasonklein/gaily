class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  attr_accessible :paid_deposit, :pre_work, :user_attributes, :course_id, :user_id

  accepts_nested_attributes_for :user
end
