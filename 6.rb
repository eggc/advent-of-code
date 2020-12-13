require_relative 'helper'

def solve_sample
  groups = read_groups('6.sample.txt')
  yes_questions = groups.map { |group| find_yes_questions(group).size }
  yes_questions.sum
end

def find_yes_questions(lines)
  lines.join('').each_char.uniq
end

puts solve_sample
