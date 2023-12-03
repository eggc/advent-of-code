require_relative "helper"

def range_of(rule)
  min, max = rule.split('-')
  (min.to_i)..(max.to_i)
end

def solve
  valid_line_size = 0

  each_lines("2.input.txt") do |line|
    rule, letter, password = line.delete(':').split(' ')
    count = password.count(letter)

    if range_of(rule).include?(count)
      valid_line_size += 1
    end
  end

  valid_line_size
end

def solve2
  valid_line_size = 0

  each_lines("2.input.txt") do |line|
    rule, letter, password = line.delete(':').split(' ')
    positions = rule.split('-')

    a = password[positions[0].to_i - 1] == letter
    b = password[positions[1].to_i - 1] == letter

    if !a && b || a && !b
      valid_line_size += 1
    end
  end

  valid_line_size
end

puts solve
puts solve2
