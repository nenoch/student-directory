@students = []

# define methods

def print_menu
  # print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

# I think this way is clearer
def start
  loop do
    print_menu
    make_choice(STDIN.gets.chomp)
  end
end

# I think this way is clearer
def make_choice(selection)
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
    exit # terminates the programme
  else
    puts "I don't know what you mean, try again."
  end
end

# a method to push hashes into the students array
def students_array(name,cohort)
  @students << {name: name, cohort: cohort}
end


def input_students
  puts "Please enter the names of the students."
  puts "To finish just hit return twice."
  # @ makes the variable accessible to all methods.
  name = STDIN.gets.chomp
  while !name.empty? do
    cohort = :november
    students_array(name,cohort)
    puts "Now we have #{@students.count} students!"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end
# .each counts every instances [0]"Dr. Lecter" [1]:november
def print_student_list
  @students.each do |name|
  puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students."
end

def save_students
  # using block method with File.open
  File.open("students.csv", "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

# using block method with File.open
def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      cohort = cohort.to_sym
      students_array(name,cohort)
    end
  end
end

# I think this way is clearer
def load_students_command_line
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


#print it out!
load_students_command_line
start
