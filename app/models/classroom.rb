class Classroom < ActiveRecord::Base
  attr_accessible :equipment, :name, :other_aspects

  validates :equipment, :name, :other_aspects, presence: true
  validates :name, uniqueness: true

  has_many :bookings
  has_many :courses, through: :bookings
end
