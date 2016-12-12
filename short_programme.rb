
def print_source
  File.open(__FILE__, "r") do |file|
    file.readlines.each do |line|
      puts line
    end
  end
end

print_source
