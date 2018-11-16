# Write a function to determine if two strings are permutations of one another
def are_strings_pemutations(str1, str2)
  character_usage = {}
  str1.split('').each do |char|
    if character_usage[char] == nil
      character_usage[char] = 0
    end

    character_usage[char] += 1
  end

  str2.split('').each do |char|
    map_value = character_usage[char]

    return false if map_value == nil || map_value == 0

    character_usage[char] -= 1
  end

  character_usage.each do |key, val|
    return false if val != 0
  end

  return true
end

puts "Should be true for abc and bca: #{are_strings_pemutations('abc', 'bca')}"
puts "Should be false for abc and def: #{are_strings_pemutations('abc', 'def')}"