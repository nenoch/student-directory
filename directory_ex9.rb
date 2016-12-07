# define methods

def input_students
  puts "Please enter the names of the students."
  puts "To finish just hit return twice."
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    if students.count == 1
      puts "Now we have #{students.count} student!"
    else
      puts "Now we have #{students.count} students!"
    end
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
  puts "#{name[:name]} (#{name[:cohort]} cohort)"
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
