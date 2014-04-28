class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :role, :username

  has_many :enrollments
  has_many :courses, through: :enrollments
end
