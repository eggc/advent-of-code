require_relative "helper"

class Passport
  REQUIRE_KEYS = %w(byr ecl eyr hcl hgt iyr pid)
  VALID_EYE_COLORS = %w(amb blu brn gry grn hzl oth)

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

  def strict_valid?
    validate_as_year(@attributes['byr'], 1920..2002) &&
      validate_as_year(@attributes['iyr'], 2010..2020) &&
      validate_as_year(@attributes['eyr'], 2020..2030) &&
      validate_height &&
      validate_hair_color &&
      validate_eye_color &&
      validate_passport_id
  end

  def to_s
    presence = valid?
    valid = presence && strict_valid?

    format("presence: %5s, valid: %5s, %s", presence, valid, @attributes)
  end

  private

  def validate_as_year(year_string, range)
    year = year_string.to_i
    year_string.length == 4 && range.include?(year)
  end

  def validate_height
    height_string = @attributes['hgt']
    height = height_string.to_i

    if height_string.end_with?('cm')
      (150..193).include?(height)
    elsif height_string.end_with?('in')
      (59..76).include?(height)
    else
      false
    end
  end

  def validate_hair_color
    @attributes['hcl'].length == 7 &&
      @attributes['hcl'].match?(/#[0-9a-f]{6}/)
  end

  def validate_eye_color
    VALID_EYE_COLORS.include?(@attributes['ecl'])
  end

  def validate_passport_id
    @attributes['pid'].length == 9 &&
      @attributes['pid'].match?(/[0-9]{9}/)
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

def solve1
  passports = passports_from("4.input.txt")
  passports.each_with_index do |passport, i|
    puts "#{i} #{passport.to_s}"
  end

  puts "valid: #{passports.count(&:valid?)}"
  puts "invalid: #{passports.count { |x| !x.valid? }}"
end

def solve2
  passports = passports_from(ARGV[0] || "4.input.txt")

  valid_count = passports.count do |passport|
    passport.valid? && passport.strict_valid?
  end

  passports.each_with_index do |passport, i|
    puts "#{i} #{passport.to_s}"
  end

  puts "valid: #{valid_count}"
  puts "invalid: #{passports.count - valid_count}"
end

solve2
