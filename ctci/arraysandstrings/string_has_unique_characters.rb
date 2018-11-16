# Write algorithm to determine if a string has all unique characters
def all_unique_characters(str)
  characters_seen = {}
  str.split('').each do |char|
    return false if characters_seen[char] != nil
    characters_seen[char] = 1
  end
  
  return true
end

puts "Should be true for abcdefg: #{all_unique_characters('abcdefg')}"
puts "Should be false for abcda: #{all_unique_characters('abcda')}"

# Follow-up: What if you can't use an additional data structure?
def all_unique_characters2(str)
  length = str.length
  str.split('').each_with_index do |char, i|
    rest_of_string = str[i+1...length]
    rest_of_string.split('').each do |next_char|
      return false if char == next_char
    end
  end
  
  return true
end

puts "Should be true for abcdefg: #{all_unique_characters2('abcdefg')}"
puts "Should be false for abcda: #{all_unique_characters2('abcda')}"
