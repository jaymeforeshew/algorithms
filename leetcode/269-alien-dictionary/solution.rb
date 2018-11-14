# @param {String[]} words
# @return {String}
def alien_order(words)
  # edges will keep track of the characters a char(key) is necessarily before
  edges = {}

  # chars_before_me will store the number of characters that are necessarily before each char(key)
  chars_before_me = {}

  # load each character
  words.each do |word|
      word.split('').each do |char|
          chars_before_me[char] = 0
      end
  end

  # build edges
  words.each_with_index do |word, index|
    if index == words.length - 1
      break
    end

    next_word = words[index + 1]
    length = [word.length, next_word.length].min

    (0..length - 1).each do |j|
      if word[j] != next_word[j]   
        start_char = word[j]
        end_char = next_word[j]

        if edges[start_char] == nil
          edges[start_char] = []
        end

        if !edges[start_char].include?(end_char)
          edges[start_char].push(end_char)
          chars_before_me[end_char] += 1
        end

        break
      end
    end
  end
  
  # BFS
  to_visit = []
  chars_before_me.each do |k, v|
    if v == 0
      to_visit.push(k)
    end
  end
  
  result = ""
  while to_visit.length > 0
    char = to_visit.shift
    result += char
    
    next if edges[char] == nil
    
    edges[char].each do |connected_char|
      next if result.include?(connected_char) 
      
      chars_before_me[connected_char] -= 1;
      if chars_before_me[connected_char] == 0
        to_visit.push(connected_char) 
      end
    end
  end
  
  return "" if result.length != chars_before_me.length
  
  return result
end
