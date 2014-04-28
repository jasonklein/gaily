class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :person
  attr_accessible :paid_deposit, :pre_work, :person_attributes

  accepts_nested_attributes_for :person
end
