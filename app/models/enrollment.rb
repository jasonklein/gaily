class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student, class_name: "User"
  attr_accessible :paid_deposit, :pre_work, :student_attributes, :course_id, :student_id

  accepts_nested_attributes_for :student

  validates :paid_deposit, :pre_work, :student_id, :course_id, presence: true

  validate :student_enrolled_once_per_course

  def student_enrolled_once_per_course
    if Enrollment.where(course_id: :course_id, student_id: :student_id).any?
      errors.add(:student, "cannot be enrolled in this course more than once.")
    end
  end
end
