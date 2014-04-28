class Course < ActiveRecord::Base
  attr_accessible :description, :end_time, :name, :start_time, :enrollments_attributes, :assignments_attributes

  has_one :booking
  has_one :classroom, through: :booking

  has_many :enrollments
  has_many :assignments
  has_many :people, through: :enrollments
  has_many :people, through: :assignments

  accepts_nested_attributes_for :enrollments
  accepts_nested_attributes_for :assignments
end
