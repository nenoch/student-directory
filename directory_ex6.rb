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
  puts "The students of Villains Academy".center(50)
  puts "-----------".center(50)
end

# .each counts every instances [0]"Dr. Lecter" [1]:november
def print(names)
  names.each do |name|
  puts "#{name[:name]} (#{name[:cohort]} cohort)".center(50)
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students.\n".center(50)
end

#print it out!
students = input_students
print_header
print(students)
print_footer(students)
