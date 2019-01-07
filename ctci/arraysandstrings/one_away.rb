# There are three types of edits that can be performed on a string:
# Insert a char, delete a char, or replace a char
# Given two strings, determine if they are one or zero edits away from each other.

=begin
I want to explain my algorithm before actually programming it:

We can categorize the type of edit prior to starting based off of the length of the words.
If str2.length == str1.length + 1, it's an addition
If str2.length == str1.length, it's an update
If str2.length == str.length - 1, it's a delete
Else it's false (any other change would require more than one edit)

So, based off of this, I want to iterate through until I find the a mismatch.

Once we find the mismatch, we will either iterate only str2, only str1, or both if it
is an addition, deletion, or update respectively.
=end

def one_character_away(str, edited)
  str_iterator = 0
  edited_iterator = 0
  found_mismatch = false

  return false if (str.length - edited.length).abs > 1

  while str_iterator < str.length
    if str[str_iterator] != edited[edited_iterator]
      return false if found_mismatch == true

      found_mismatch = true
      
      length_difference = str.length - edited.length
      case length_difference
      when -1
        edited_iterator += 1
      when 1
        str_iterator += 1
      when 0
        str_iterator += 1
        edited_iterator += 1
      else
        return false
      end

      next
    end

    edited_iterator += 1
    str_iterator += 1
  end

  return true
end

puts "abcd and abcd should be true. Result: #{one_character_away('abcd', 'abcd')}"
puts "abcd and abd should be true. Result: #{one_character_away('abcd', 'abd')}"
puts "abcd and abcde should be true. Result: #{one_character_away('abcd', 'abcde')}"
puts "abcd and abed should be true. Result: #{one_character_away('abcd', 'abed')}"
puts "abcd and abbb should be false. Result: #{one_character_away('abcd', 'abbb')}"
puts "abcd and abcdef should be false. Result: #{one_character_away('abcd', 'abcdef')}"
puts "abcd and aecd should be true. Result: #{one_character_away('abcd', 'aecd')}"