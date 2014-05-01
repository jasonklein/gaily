class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :first_name, :last_name, :role, :username

  has_many :enrollments, foreign_key: "student_id"
  has_many :assignments, foreign_key: "instructor_id"
  has_many :courses, through: :enrollments
  has_many :courses, through: :assignments

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
