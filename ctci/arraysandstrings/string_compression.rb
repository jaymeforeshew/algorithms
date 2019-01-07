# Given a string, compress it using the counts of repeated characters.
# For example, aabcccccaaa becomes a2b1c5a3
# If the compressed string is larger than the original, return the original

=begin
Explanation prior to programming the solution:

Have a result string that is initially empty.
Have an iterator on the string, and loop until I find a different character.
Keep count as we're doing this.
Add letter+number to result string.
Continue.
=end

def compress(str)
  result = ''
  current_letter = ''
  count = 0

  str.split('').each do |char|
    if char != current_letter && count != 0
      result += current_letter + count.to_s
    end

    current_letter = char
    count += 1
  end

  return str if str.length <= result.length
  
  return result
end

puts "aaaaaa should return a6. Result: #{compress('aaaaaa')}"
puts "aaaaabbccd should return a5b2c2d1. Result: #{compress('aaaaabbccd')}"
puts "a should return a. Result: #{compress('a')}"
puts "aabbccdd should return aabbccdd. Result: #{compress('aabbccdd')}"