# Given a string, determine if it is a permutation of a palindrome.
# Case insensitive.
# Spaces seem to not matter.

=begin
I want to describe my algorithm before programming it:

In order for this string to be a permutation of a palindrome, it either:

- in the case of an even-length string it should have an even number of each character, or
- in the case of an odd-length string, it should have an even number of each character except 1.

My function will iterate through each character in the string and create a map of each letter.
I will discard spaces as I see them.

I will keep a counter of the number of odd counts so far, so that I don't have to iterate through my map later.
=end

def is_permutation_of_palindrome(str)
  number_of_odds = 0
  characters = {}

  str.split('').each do |char|
    next if char == ' '

    if characters[char] == nil
      characters[char] = 1
      number_of_odds += 1
    else
      characters[char] += 1

      if characters[char] %2 == 0
        number_of_odds -= 1
      else
        number_of_odds += 1
      end
    end
  end

  return true if str.length % 2 == 0 && number_of_odds == 0
  return true if str.length % 2 != 0 && number_of_odds == 1

  return false
end

puts "abbccaa should be true. Result: #{is_permutation_of_palindrome('abbccaa')}"
puts "abcda should be false. Result: #{is_permutation_of_palindrome('abcda')}"
puts "abba should be true. Result: #{is_permutation_of_palindrome('abba')}"
puts "abccba should be true. Result: #{is_permutation_of_palindrome('abccba')}"