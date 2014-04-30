class Course < ActiveRecord::Base
  attr_accessible :description, :end_time, :name, :start_time, :enrollments_attributes, :assignments_attributes, :booking_attributes

  validates :description, :name, :end_time, :start_time, presence: true
  validates :name, uniqueness: true

  has_one :booking, dependent: :destroy
  has_one :classroom, through: :booking

  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  has_many :assignments, dependent: :destroy
  has_many :instructors, through: :assignments

  accepts_nested_attributes_for :booking
  accepts_nested_attributes_for :enrollments
  accepts_nested_attributes_for :assignments

  

  
end
