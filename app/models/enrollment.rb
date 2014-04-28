class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :person
  attr_accessible :paid_deposit, :pre_work
end
