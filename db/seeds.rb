# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.delete_all
Person.delete_all
Classroom.delete_all
Booking.delete_all
Enrollment.delete_all
Assignment.delete_all

courses = Course.create([
  {name: "WDI 5", description: "Blah blah blah.", start_time: "9am", end_time: "5pm" },
  {name: "WDI 6", description: "Blah blah blah.", start_time: "9am", end_time: "5pm" },
  ])

people = Person.create([
  {first_name: "First", last_name: "Student", username: "first@student", role: :student},
  {first_name: "Second", last_name: "Student", username: "second@student", role: :student},
  {first_name: "First", last_name: "Instructor", username: "first@instructor", role: :instructor},
  {first_name: "Second", last_name: "Instructor", username: "second@instructor", role: :instructor},
  {first_name: "Third", last_name: "Instructor", username: "third@instructor", role: :instructor},
  {first_name: "First", last_name: "Administrator", username: "first@admin", role: :admin}
  ])

classrooms = Classroom.create([
  {name: "Room 1 (Day)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 1 (Night)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 2 (Day)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 2 (Night)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 3 (Day)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 3 (Night)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"}
  ])



