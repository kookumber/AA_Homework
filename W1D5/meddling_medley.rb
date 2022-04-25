def duos(str)
    count = 0
    str.each_char.with_index do |c1, i1|
        str.each_char.with_index do |c2, i2|
            if i2 == i1 + 1 && c2 == c1
                count += 1
            end
        end
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    words = sent.split
    new_words = []

    words.each do |word|
        if hash.key?(word)
            new_words << hash[word]
        else
            new_words << word
        end
    end
    new_words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'


def conjunct_select(arr, *prcs)
    new_arr = []

    arr.each do |ele|
        true_count = 0
        prcs.each {|prc| true_count += 1 if prc.call(ele)}
        new_arr << ele if true_count == prcs.length
    end
    new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
    #no change if less than 3 chars
    #if starts with vowel, add yay to end of word
    #if word starts with non vowel, move all letters before first vowel
    #to the end, and add ay trash => ashtray

    words = sent.split
    new_words = []
    vowels = "aeiouAEIOU"

    words.each_with_index do |word, i|
        vowel_idxer = []
        new_words << word if word.length < 3
        
        if vowels.include?(word[0]) && word.length >= 3
            new_words << word + "yay"
        elsif word.length >= 3
            word.each_char.with_index do |c, idx|
                vowel_idxer << idx if vowels.include?(c)
            end
            new_words << word[vowel_idxer[0]..-1] + word[0...vowel_idxer[0]].downcase + "ay"
        end

        new_words[i][0] = new_words[i][0].upcase if word[0] == word[0].upcase
    end
    new_words.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)

    words = sent.split
    new_words = []
    vowels = "aeiouAEIOU"

    words.each_with_index do |word, idx|
        if word.length < 3
            new_words << word
        elsif vowels.include?(word[-1])
            new_words << word + word
        else
            vowel = []
            word.each_char.with_index {|c, i| vowel << i if vowels.include?(c)}
            new_words << word + word[vowel[-1]..-1]
        end
    end

    new_words.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    new_arr = []
    arr.each do |ele|
        true_count = 0
        prcs.each {|prc| true_count += 1 if prc.call(ele)}
        new_arr << ele if true_count > 0
    end
    new_arr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    words = sent.split
    vowels = "aeiouAEIOU"
    new_words = []
    # remove first vowel if index is even
    # remove last vowel if index is odd
    # no change if has no vowels

    words.each_with_index do |word, idx|
        vowel_idx = []
        word.each_char.with_index {|c, i| vowel_idx << i if vowels.include?(c)}
        if vowel_idx.length == 0
            new_words << word
        elsif idx % 2 == 0
            word[vowel_idx[0]] = ""
            new_words << word
        else
            word[vowel_idx[-1]] = ""
            new_words << word
        end
    end

    new_words.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(sent)
    words = sent.split
    new_words = []
    vowels = "aeiouAEIOU"

    words.each do |word|
        if vowels.include?(word[-1])
            new_words << word + word[-1]
        else
            silly_word = ""
            word.each_char do |c|
                if vowels.include?(c)
                    silly_word += c + "b" + c.downcase
                else
                    silly_word += c
                end
            end
            new_words << silly_word
        end
    end


    new_words.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(word)
    compressed = ""

    word.each_char.with_index do |c1, i1| # check next letter is same as current but not same as previous
        counter = 1
        word.each_char.with_index do |c2, i2|
            if i2 > i1 && c2 == c1 && word[i1-1] != c1 #&& word[i2-1] != c1
                counter += 1
            end
        end
        if counter > 1
            compressed += c1 + counter.to_s
        else
            compressed += c1
        end
    end

    compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"