def random_country
  countries = [
  "England", "France", "Germany", "Canada", "Austalia",
  "United States", "Ukraine", "Netherlands", "Spain",
  "Japan", "China"]
  
  countries[rand(11)]
end
  


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, country: random_country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  counter = 0
  until counter == students.length
  puts "#{students[counter][:name]} (#{students[counter][:cohort]} Cohort) (Country: #{students[counter][:country]})"
  counter += 1
  end
end
  

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
