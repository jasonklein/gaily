class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :role, :username

  has_many :enrollments, foreign_key: "student_id"
  has_many :assignments, foreign_key: "instructor_id"
  has_many :courses, through: :enrollments
  has_many :courses, through: :assignments
end
