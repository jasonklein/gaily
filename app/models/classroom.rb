class Classroom < ActiveRecord::Base
  attr_accessible :equipment, :name, :other_aspects

  has_many :bookings
  has_many :courses, through: :bookings
end
