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

# .each counts every instances [0]"Dr. Lecter" [1]:november
def print(names)
  names.each do |name|
    if name[:name].match /^a/i
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
    end
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
