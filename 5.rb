require_relative 'helper'

def find(line, head, tail)
  line.each_char do |letter|
    # puts("#{head}, #{tail}")

    case letter
    when 'F', 'L'
      tail = tail - (tail - head + 1) / 2
    when 'B', 'R'
      head = head + (tail - head + 1) / 2
    end
  end

  if head == tail
    return head
  else
    raise 'cannot complete binary search!!'
  end
end

def find_seat_id(line)
  row_code = line[0..6]
  column_code = line[7..9]

  row = find(row_code, 0, 127)
  column = find(column_code, 0, 7)

  row * 8 + column
end

def find_sample_seat_id
  id = find_seat_id("FBFBBFFRLR")
  puts(id)
end

def solve1
  each_lines("5.input.txt").map do |line|
    find_seat_id(line)
  end.max
end

def solve2
  seat_ids = each_lines("5.input.txt").map do |line|
    find_seat_id(line)
  end.sort

  seat_ids.each_cons(2) do |i, j|
    if i+1 != j
      puts "Answer is between #{i} and #{j}"
    end
  end
end

puts solve1
puts solve2
