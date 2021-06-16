# method that generates one random country from an array of countries 
def random_country
  countries = [
  "England", "France", "Germany", "Canada", "Austalia",
  "United States", "Ukraine", "Netherlands", "Spain",
  "Japan", "China"]
  
  countries[rand(11)]
end
  

# asks the user to enter a students name and cohort
def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first person's name
  name = gets.chomp
  # get that person's cohort
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student's name, chort and random country to the array as a hash
    students << {name: name, cohort: cohort, country: random_country}
    # if there is only 1 student, handle output to reflect the correct plural cases
    if students.length  < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another person's name & their cohort from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# print each hash value in the students array
def print(students)
  counter = 0
  until counter == students.length
    puts "#{students[counter][:name]} (#{students[counter][:cohort]} Cohort) (Country: #{students[counter][:country]})"
    counter += 1
  end
end
  
#footer with conditional for plural/non-plural output
def print_footer(names)
  if names.length < 2
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
