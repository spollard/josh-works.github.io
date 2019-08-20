require 'benchmark'
# https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/

# faster?
def count_characters_shift(words, chars)
  words.reduce(0) do |res, word|
    res += word.length if word_exist_in_char_shift?(word, chars)
    res
  end
end

def word_exist_in_char_shift?(word, chars)
  char_list = chars.split("").sort
  word_chars = word.split("").sort
  word_chars.each do |wc|
    next if char_list.shift == word_chars.shift
    return false
  end
  return true
end

# slower?
def count_characters(words, chars)
    found_words = []
    words.each do |w|
        if word_chars_in_approve_list?(w, chars)
            found_words << w 
        end
    end
    return found_words.join.length
end

def word_chars_in_approve_list?(word, chars)
    word.split("").each do |c|
        if chars.include?(c)
            chars = remove_first_instance_of(c, chars)
        else
            return false
        end
    end
    return true
end

def remove_first_instance_of(c, chars)
    split_chars = chars.split("")
    index = split_chars.index(c)
    split_chars.delete_at(index)
    return split_chars.join
end

def test_happy_path
  words = %w[bat cat ab parse]
  characters = "batcb"
  result_01 = count_characters_shift(words, characters)
  p "should be 8: " + result_01.to_s
end

def test_exluded_words
  words = %w[bbb]
  characters = "bbb"
  result = count_characters_shift(words, characters)
  p "should be 3: " + result.to_s
end
# 
# test_happy_path
# test_exluded_words

Benchmark.bmbm(7) do |x|
  iterations = 100000
  words = %w[bat cat ab parse]
  characters = "batcb"

  x.report("slower") { 
    iterations.times do |foo|
      count_characters(words, characters)
    end
  }
  
  x.report("faster") { 
    iterations.times do |foo|
      count_characters_shift(words, characters)
    end
  }
end



# A more readable refactor, but should have same performance as OG
# def count_characters(words, chars)
#   words.reduce(0) do |results, word|
#     results += word.length if word_in_chars?(word, chars)
#     results
#   end
# end
# 
# def word_in_chars?(word, chars)
#   char_list = chars.split("")
#   word.split("").each do |c|
#     if char_list.include?(c)
#       char_list.delete_at(char_list.index(c))
#       next
#     end
#     return false
#   end
#   true
# end