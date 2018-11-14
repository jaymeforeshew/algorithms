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

        (0..length).each do |j|
            if word[j] != next_word[j]   
                start_char = word[j]
                end_char = next_word[j]

                if edges[start_char] == nil
                edges[start_char] = []
                end

                edges[start_char].push(end_char)
                chars_before_me[end_char] += 1

                break
            end
        end
    end

    result = ""
    chars_before_me.each do |k, v|
        if v == 0
            result += k
        end
    end
end