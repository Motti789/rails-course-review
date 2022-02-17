# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Review.destroy_all
Course.destroy_all


user1 = User.create(name: "Mrs. Yitty")
user2 = User.create(name: "Mr. Yoni")
user3 = User.create(name: "Mr. Avromi")

course1 = Course.create(name: "English Language")
course2 = Course.create(name: "Mathematics")
course3 = Course.create(name: "Science")
course4 = Course.create(name: "History")
course5 = Course.create(name: "Foreign Languages")

review1 = Review.create(title: "5 stars",  comment: "Great course I recommend!", user_id: user1.id, course_id: course1.id)
review2 = Review.create(title: "Not so easy", comment: "Tough course I think", user_id: user2.id, course_id: course2.id)
review3 = Review.create(title: "Great", comment: "Was very enjoyable!", user_id: user3.id, course_id: course3.id)
review4 = Review.create(title: "I do not know", comment: "Need to commit a lot of time towards it", user_id: user1.id, course_id: course4.id)
review5 = Review.create(title: "just Amazing", comment: "fantastic course I would do it again!", user_id: user2.id, course_id: course5.id)