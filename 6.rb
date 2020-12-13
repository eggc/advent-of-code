require_relative 'helper'

def solve_sample
  solve('6.sample.txt')
end

def solve_1
  solve('6.input.txt')
end

def solve_2
  solve_other_version('6.input.txt')
end

def solve_other_version(input_file_name)
  groups = read_groups(input_file_name)
  yes_questions = groups.map { |group| find_everyone_yes_questions(group).size }
  yes_questions.sum
end

def solve(input_file_name)
  groups = read_groups(input_file_name)
  yes_questions = groups.map { |group| find_yes_questions(group).size }
  yes_questions.sum
end

def find_yes_questions(lines)
  lines.join('').each_char.uniq
end

def find_everyone_yes_questions(lines)
  # 最初の回答を基準にしておく
  yes_questions = lines.first.split('')

  lines.each do |line|
    yes_questions = line.split('') & yes_questions
  end

  yes_questions
end

puts solve_sample
puts solve_1
puts solve_other_version('6.sample.txt')
puts solve_2
