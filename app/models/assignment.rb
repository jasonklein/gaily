class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :person
  attr_accessible :contract_fee, :position, :person_attributes, :course_id, :person_id

  accepts_nested_attributes_for :person
end
