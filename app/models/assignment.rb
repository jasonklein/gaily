class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :person
  attr_accessible :contract_fee, :position, :person_attributes

  accepts_nested_attributes_for :person
end
