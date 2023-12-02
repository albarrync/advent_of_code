# Regex to match numbers
# Map into array to get 0th and -1th index

calibration_document = File.read("calibration.txt")

lines = calibration_document.split("\n")

numbers_lines = lines.map do |line|
  line.chars.select{ |char| char.match?(/\d/)}.join("")
end

first_and_last_numbers = numbers_lines.map do |row|
  [row[0], row[-1]].join("")
end

total = first_and_last_numbers.map(&:to_i).sum
puts total
