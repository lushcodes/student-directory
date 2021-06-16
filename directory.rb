@students = [] # an array accesible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

# methods run based on user input selection
def process(selection)
  case selection
    when "1"
     input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

# asks the user to enter a students name and cohort
def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  # get the first person's name
  name = STDIN.gets.chomp
  # get that person's cohort
  cohort = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student's name, chort and random country to the array as a hash
    @students << {name: name, cohort: cohort, country: random_country}
    # if there is only 1 student, handle output to reflect the correct plural cases
    if @students.length  < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another person's name & their cohort from the user
    name = STDIN.gets.chomp
    cohort = STDINgets.chomp
  end
  # return the updated array of students
  @students
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do | student |
    student_data = [student[:name], student[:cohort], student[:country]]
    # prints student array to csv file
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  # open the file for reading
  file = File.open(filename, "r")
  # iterate over the array of students and read csv file
  file.readlines.each do | line |
    name, cohort, country = line.chomp.split(", ")
    # store data in students array
    @students << {name: name, cohort: cohort.to_sym, country: country.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end







# method that generates one random country from an array of countries 
def random_country
  countries = [
  "England", "France", "Germany", "Canada", "Austalia",
  "United States", "Ukraine", "Netherlands", "Spain",
  "Japan", "China"]
  
  countries[rand(11)]
end

# prints header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# print each hash value in the students array
def print_students_list
  counter = 0
  until counter == @students.length
    puts "#{@students[counter][:name]} (#{@students[counter][:cohort]} Cohort) (Country: #{@students[counter][:country]})"
    counter += 1
  end
end
  
# footer with conditional for plural/non-plural output
def print_footer
  if @students.length < 2
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

try_load_students
interactive_menu
