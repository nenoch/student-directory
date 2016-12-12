def input_students
  puts "Please enter the names of the students."
  puts "To finish just hit return twice."
  students = []
  name = gets.chomp
  name = name.to_sym
  while !name.empty? do
    puts "Please enter the cohort of the student."
    cohort = gets.chomp
    cohorts = ["January","March","May","June","September","November"]
      if cohort.empty?
        cohort = :no_input
      else
        while !cohorts.any? { |month| cohort.include? month}
        puts "There are typos in your entry. Could you type the cohort in again please?"
        cohort = gets.chomp
        end
      cohort = cohort.to_sym
      end
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students!"
    puts "Please enter next student."
    name = gets.chomp
    name = name.to_sym
  end
  if name.empty?
    name = :no_name
  end
    puts "Now we have #{students.count} students!"
    students
end


def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end


def print_cohort(names)
  cohorts = [:January,:March,:May,:June,:September,:November]
  i = 0
  until i == 6
    names.map do |name|
      name.select do |k,v|
        if [cohorts[i]].include? v
          puts "#{name[:name]} (#{name[:cohort]} cohort)"
        end
      end
    end
    i += 1
  end
end


def print_footer(names)
  puts "Overall we have #{names.count} great students."
end

#print it out!
students = input_students
print_header
print_cohort(students)
print_footer(students)
