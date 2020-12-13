require_relative "helper"

class Passport
  REQUIRE_KEYS = %w(byr ecl eyr hcl hgt iyr pid)

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

  def valid?
    (REQUIRE_KEYS - @attributes.keys).length == 0
  end

  def to_s
    format("[%5s] %s", valid?, @attributes.keys.sort.join(","))
  end
end

def passports_from(input_file_name)
  passports = []
  temporary_lines = []
  lines = each_lines(input_file_name).map { |line| line }
  lines << "" # 終端記号として空行を入れておく

  lines.each_with_index do |line, i|
    if line.strip.empty?
      passports << Passport.new(temporary_lines)
      temporary_lines  = []
    else
      temporary_lines << line
    end
  end

  passports
end

def solve
  passports = passports_from("4.input.txt")
  passports.each_with_index do |passport, i|
    puts "#{i} #{passport.to_s}"
  end

  puts "valid: #{passports.count(&:valid?)}"
  puts "invalid: #{passports.count { |x| !x.valid? }}"
end

solve
