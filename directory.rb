# define methods

def input_students
  puts "Please enter the names of the students."
  puts "To finish just hit return twice."
  # @ makes the variable accessible to all methods.
  @students = []
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students!"
    name = gets.chomp
  end
  @students
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

def print_menu
  # print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit # terminates the programme
  else
    puts "I don't know what you mean, try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    # here puts writes on a file, not on the screen
    file.puts csv_line
  end
  file.close
end

#print it out!
interactive_menu
