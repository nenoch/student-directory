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

def print(names)
  i = 0
  while names[i]
    puts "#{names[i][:name]} (#{names[i][:cohort]} cohort)"
    i += 1
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
