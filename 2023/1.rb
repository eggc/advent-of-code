# frozen_string_literal: true

NUMBER_CHARS = ('0'..'9').freeze

def answer1
  File.open('input.txt') do |f|
    puts(
      f.each_line.sum do |line|
        first_digit = line.each_char.find { |char| NUMBER_CHARS.member?(char) }
        last_digit = line.reverse.each_char.find { |char| NUMBER_CHARS.member?(char) }
        [first_digit, last_digit].join.to_i
      end
    )
  end
end

def find_digit(line, reverse:)
  line.size.times do |i|
    i = line.size - i - 1 if reverse

    if NUMBER_CHARS.member?(line[i])
      return line[i]
    else
      case line[i..i+2]
      when 'one' then return "1"
      when 'two' then return "2"
      when 'six' then return "6"
      end

      case line[i..i+3]
      when 'zero' then return "0"
      when 'four' then return "4"
      when 'five' then return "5"
      when 'nine' then return "9"
      end

      case line[i..i+4]
      when 'three' then return "3"
      when 'seven' then return "7"
      when 'eight' then return "8"
      end
    end
  end
end

def answer2
  File.open('input.txt') do |f|
    puts(
      f.each_line.sum do |line|
        first_digit = find_digit(line, reverse: false)
        last_digit = find_digit(line, reverse: true)
        [first_digit, last_digit].join.to_i
      end
    )
  end
end

answer1
answer2
