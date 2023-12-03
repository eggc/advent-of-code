require "pry"
require_relative '../helper'
require_relative 'rule'
require_relative 'rule_set'
require_relative 'line'

def solve_sample
  solve('7/sample.txt')
end

def solve_1
  solve('7/input.txt')
end

def solve(input_file_name)
  rule_set = build_rule_set(input_file_name)
  rule_set.colors.count do |color|
    rule_set.contain?(color, 'shiny gold')
  end
end

def solve_2(input_file_name)
  rule_set = build_rule_set(input_file_name)
  rule_set.number_of_components('shiny gold') - 1
end

def build_rule_set(input_file_name)
  RuleSet.new.tap do |rule_set|
    each_lines(input_file_name) do |line|
      rules = Line.parse(line)
      rules.each do |rule|
        rule_set.add(rule)
      end
    end
  end
end

pp solve_sample
pp solve_1
pp solve_2('7/sample.txt')
pp solve_2('7/input.txt')
