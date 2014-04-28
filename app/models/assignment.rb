class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  attr_accessible :contract_fee, :position, :user_attributes, :course_id, :user_id

  accepts_nested_attributes_for :user
end
