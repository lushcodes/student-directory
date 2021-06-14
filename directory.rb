# Declare an array of student names
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
  ]

# print the array of student names by iterating over each value in the array
puts "The students of Villains Academy"
puts "-------------"
students.each do  | student |
  puts student
  end
#finally, we print the total number of students
puts "Overall, we have #{students.count} great students"