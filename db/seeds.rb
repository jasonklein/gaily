# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.delete_all
User.delete_all
Classroom.delete_all
Booking.delete_all
Enrollment.delete_all
Assignment.delete_all

courses = Course.create([
  {name: "Front End Development Immersive 1", description: "Design and code beautiful, interactive client-facing websites. Program websites in HTML, CSS and JavaScript. Master the technical vocabulary to communicate your ideas to your teammates and other stakeholders.", start_time: "9AM", end_time: "5PM" },
  {name: "Front End Development Immersive 2", description: "Design and code beautiful, interactive client-facing websites. Program websites in HTML, CSS and JavaScript. Master the technical vocabulary to communicate your ideas to your teammates and other stakeholders.", start_time: "9AM", end_time: "5PM" },
  {name: "Front End Development Immersive 3", description: "Design and code beautiful, interactive client-facing websites. Program websites in HTML, CSS and JavaScript. Master the technical vocabulary to communicate your ideas to your teammates and other stakeholders.", start_time: "9AM", end_time: "5PM" },
  {name: "Front End Development Immersive 4", description: "Design and code beautiful, interactive client-facing websites. Program websites in HTML, CSS and JavaScript. Master the technical vocabulary to communicate your ideas to your teammates and other stakeholders.", start_time: "9AM", end_time: "5PM" },
  {name: "Web Development Immersive 1", description: "Build a work-ready skill set and fluency in full stack web development. Develop a portfolio of projects individually and in small teams that are ready to present to employers. Prepare for an internship or entry-level job as a jr. web developer.", start_time: "9AM", end_time: "5PM" },
  {name: "Web Development Immersive 2", description: "Build a work-ready skill set and fluency in full stack web development. Develop a portfolio of projects individually and in small teams that are ready to present to employers. Prepare for an internship or entry-level job as a jr. web developer.", start_time: "9AM", end_time: "5PM" },
  {name: "Web Development Immersive 3", description: "Build a work-ready skill set and fluency in full stack web development. Develop a portfolio of projects individually and in small teams that are ready to present to employers. Prepare for an internship or entry-level job as a jr. web developer.", start_time: "9AM", end_time: "5PM" },
  {name: "User Experience Design Immersive 1", description: "The User Experience Design Immersive aims to get students to think like designers, and equip them with the skills and tools necessary to implement their visions.", start_time: "9AM", end_time: "5PM" },
  ])

users = User.create([
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Wacko", last_name: "Warner", username: "wacko@example.com", role: :student},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Topanga", last_name: "Lawrence", username: "topanga@example.com", role: :student},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Liz", last_name: "Lemon", username: "liz@example.com", role: :student},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Ron", last_name: "Swanson", username: "ron@example.com", role: :student},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Heathcliff", last_name: "Huxtable", username: "heathcliff@generalassemb.ly", role: :instructor},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Rose", last_name: "Tyler", username: "rose@generalassemb.ly", role: :instructor},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Geordie", last_name: "LaForge", username: "geordie@generalassemb.ly", role: :instructor},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Francis", last_name: "Urquhart", username: "francis@generalassemb.ly", role: :admin},
  {password: "jimmies!sprinkles!", password_confirmation: "jimmies!sprinkles!", first_name: "Jason", last_name: "Banks", username: "jason@generalassemb.ly", role: :admin}
  ])

classrooms = Classroom.create([
  {name: "Room 1 (Day)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 1 (Night)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 2 (Day)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 2 (Night)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 3 (Day)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"},
  {name: "Room 3 (Night)", equipment: "Beep boop beep", other_aspects: "Blah blah blah"}
  ])

bookings = Booking.create([
  {course_id: 1, classroom_id: 1, start_date: "2014-05-15", end_date: "2014-05-29"},
  {course_id: 2, classroom_id: 1, start_date: "2014-06-05", end_date: "2014-06-28"},
  {course_id: 3, classroom_id: 1, start_date: "2014-07-10", end_date: "2014-07-29"},
  {course_id: 4, classroom_id: 1, start_date: "2014-08-15", end_date: "2014-08-28"},
  {course_id: 5, classroom_id: 3, start_date: "2014-05-05", end_date: "2014-05-29"},
  {course_id: 6, classroom_id: 3, start_date: "2014-06-05", end_date: "2014-06-30"},
  {course_id: 7, classroom_id: 3, start_date: "2014-07-15", end_date: "2014-07-30"},
  {course_id: 8, classroom_id: 3, start_date: "2014-08-10", end_date: "2014-08-30"}
  ])

enrollments = Enrollment.create([
  {course_id: 1, student_id: 1, paid_deposit: true, pre_work: "Yes"},
  {course_id: 1, student_id: 2, paid_deposit: false, pre_work: "Yes"},
  {course_id: 7, student_id: 3, paid_deposit: true, pre_work: "No"},
  {course_id: 7, student_id: 4, paid_deposit: false, pre_work: "Yes"},
  {course_id: 8, student_id: 3, paid_deposit: true, pre_work: "N/A"}
  ])

assignments = Assignment.create([
  {course_id: 1, instructor_id: 5, contract_fee: 10000, position: :primary},
  {course_id: 1, instructor_id: 6, contract_fee: 7500, position: :secondary},
  {course_id: 7, instructor_id: 5, contract_fee: 10000, position: :primary},
  {course_id: 7, instructor_id: 6, contract_fee: 7500, position: :secondary},
  {course_id: 7, instructor_id: 7, contract_fee: 6000, position: :assistant},
  {course_id: 8, instructor_id: 6, contract_fee: 10000, position: :primary},
  ])















