# Given a string and its length, replace all spaces with %20.
# Do it in place.
# String is guaranteed to have sufficient space at the end of it.
def replace_spaces(str, length)
  index = 0

  while index < length
    if str[index] == ' '
      (length-1).downto(index+3) do |i|
        str[i] = str[i-2]
      end

      str[index] = '%'
      str[index+1] = '2'
      str[index+2] = '0'
    end
    
    index += 1
  end

  return str
end

puts "'abc d  ' should result in 'abc%20d': #{replace_spaces('abc d  ', 7) == 'abc%20d'}"
puts "'abcdefg' should result in 'abcdefg': #{replace_spaces('abcdefg', 7) == 'abcdefg'}"
puts "'a b c d      ' should result in 'a%20b%20c%20d': #{replace_spaces('a b c d      ', 13) == 'a%20b%20c%20d'}"
puts "'abcde   ' should result in 'abcde%20': #{replace_spaces('abcde   ', 8) == 'abcde%20'}"
puts "' abc  ' should result in '%20abc': #{replace_spaces(' abc  ', 6) == '%20abc'}"
puts "'abc   ' should result in 'abc%20': #{replace_spaces('abc   ', 6) == 'abc%20'}"