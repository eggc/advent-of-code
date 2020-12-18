require_relative '../helper'
require_relative 'rule'
require_relative 'rule_set'
require_relative 'line'

def solve_sample
  solve('7/sample.txt')
end

def solve(input_file_name)
  result = []
  rule_set = build_rule_set(input_file_name)
  rule_set.to_s
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
