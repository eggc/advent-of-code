require_relative "helper"

class Passport
  def initialize(lines)
    @attributes = parse(lines)
  end

  def parse(lines)
    line = lines.join(' ')
    key_and_values = line.split(" ")
    key_and_values.each_with_object({}) do |key_and_value, result|
      key, value = key_and_value.split(":")
      result[key] = value
    end
  end

  def to_s
    @attributes.to_s
  end
end

def passports_from(input_file_name)
  passports = []
  lines = []

  each_lines(input_file_name) do |line|
    if line.strip.empty?
      passports << Passport.new(lines)
      lines  = []
    else
      lines << line
    end
  end

  passports
end

puts passports_from("4.sample.txt")
