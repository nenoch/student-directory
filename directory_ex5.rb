# define methods

def input_students
  puts "Please enter the names of the students."
  puts "To finish just hit return twice."
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Please enter the country of birth of the student."
    nationality = gets.chomp
    puts "Please enter the date of birth of the student."
    birthday = gets.chomp
    students << {name: name, dob: birthday, cob: nationality, cohort: :november}
    puts "Now we have #{students.count} students!"
    puts "Please enter next student."
    name = gets.chomp
  end
  # puts "Please enter the nationality of the students."
  # nationality = gets.chomp

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

# .each counts every instances [0]"Dr. Lecter" [1]:november
def print(names)
  names.each do |name|
  puts "#{name[:name]}, date of birth: #{name[:dob]}, country of birth: #{name[:cob]} (#{name[:cohort]} cohort)"
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
