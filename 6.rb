require_relative 'helper'

def solve_sample
  solve('6.sample.txt')
end

def solve_1
  solve('6.input.txt')
end

def solve(input_file_name)
  groups = read_groups(input_file_name)
  yes_questions = groups.map { |group| find_yes_questions(group).size }
  yes_questions.sum
end

def find_yes_questions(lines)
  lines.join('').each_char.uniq
end

puts solve_sample
puts solve_1
