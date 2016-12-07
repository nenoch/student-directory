# students into hashes
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#  {name:"Darth Vader", cohort: :november},
#  {name:"Nurse Ratched", cohort: :november},
#  {name:"Michael Corleone", cohort: :november},
#  {name:"Alex DeLarge", cohort: :november},
#  {name:"The Wicked Witch of the West", cohort: :november},
#  {name:"Terminator", cohort: :november},
#  {name:"Freddy Krueger", cohort: :november},
#  {name:"The Joker", cohort: :november},
#  {name:"Joffrey Baratheon", cohort: :november},
#  {name:"Norman Bates", cohort: :november}
# ]

# define methods

def input_students
  puts "Please enter the names of the students."
  puts "To finish just hit return twice."
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students!"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

# I used .each.with_index instead of each_with_index because the 2nd started with 0
def print(names)
  names.each.with_index(1) do |name,i|
  puts "#{i}| #{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students."
end

#print it out!
students = input_students
print_header
print(students)
print_footer(students)
