class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :person
  attr_accessible :contract_fee, :position
end
