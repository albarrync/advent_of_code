calibration_document = File.read("calibration.txt")

CHARS = { "zero"  => "0",
          "one"   => "1",
          "two"   => "2",
          "three" => "3",
          "four"  => "4",
          "five"  => "5",
          "six"   => "6",
          "seven" => "7",
          "eight" => "8",
          "nine"  => "9" }

lines = calibration_document.split("\n")

def scan_for_digits(line)
  found_digits = []
  n = 0
  last_found_index = 0

  while n < line.length
    if line[n].match?(/\d/)
      if n > last_found_index || last_found_index == 0
        found_digits.push(line[n])
        last_found_index = n
      end
    end

    matched_string = CHARS.keys.select{ |key| line[last_found_index..n].match?(key) }.first
    if matched_string
      found_digits.push(CHARS[matched_string])
      last_found_index = n - 1
      next
    end
    n += 1
  end

  found_digits.join("")
end

numbers_lines = lines.map do |line|
  scan_for_digits(line)
end

first_and_last_numbers = numbers_lines.map do |row|
  [row.chars.first, row.chars.last].join("")
end

total = first_and_last_numbers.map(&:to_i).sum
puts total
