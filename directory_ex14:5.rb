@students = []

# define methods

def print_menu
  # print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a specific file (or students.csv by default)"
  puts "4. Load the list from a specific file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

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
    exit # terminates the programme
  else
    puts "I don't know what you mean, try again."
  end
end

def input_students
  puts "Please enter the names of the students."
  puts "To finish just hit return twice."
  # @ makes the variable accessible to all methods.
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
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
  # open the file for writing
  puts "Would you like the students to be add to a specific file?"
  puts "Press ENTER for default settings, otherwise Add the file name here: "
  writing_file = STDIN.gets.chomp
  if writing_file.empty?
    file = File.open("students.csv", "w")
  else
    file = File.open(writing_file, "w")
  end
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    # here puts writes on a file, not on the screen
    file.puts csv_line
  end
  file.close
end

# giving a default file as value for filename when no other file are declared
def load_students
  puts "Students List file required: "
  reading_file = STDIN.gets.chomp
  while !File.exists?(reading_file)
    puts "Sorry, #{reading_file} doesn't exist."
    puts "Type the file name: "
    reading_file = STDIN.gets.chomp
  end
  file = File.open(reading_file, "r")
  file.readlines.each do |line|
    # parallel assignment
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
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


#print it out!
try_load_students
interactive_menu
