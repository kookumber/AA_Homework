# Define your methods here. 

require "byebug"

def first_letter_vowel_count(sent)
    count = 0
    arr = sent.split(" ")
    arr.each {|ele| count += 1 if "aeiou".include?(ele[0].downcase)}
    count
end

def count_true(arr, prc)
    count = 0
    arr.each {|ele| count += 1 if prc.call(ele)}
    count
end

def procformation(arr, prc_1, prc_2, prc_3) #true use prc2, false use prc3
    new_arr = [] 
    arr.each do |ele|
        if prc_1.call(ele) == true
            new_ele = prc_2.call(ele)
            new_arr << new_ele
        else
            new_ele = prc_3.call(ele)
            new_arr << new_ele
        end
    end
    new_arr
end

def array_of_array_sum(arr)
    sum = 0
    arr.each {|ele| sum += ele.sum}
    sum
end

def selective_reverse(sent) #reverse unless it starts/ends with vowel
    words = sent.split(" ")
    reversed = []
    vowels = "aeiouAEIOU"
    words.each do |word|
        if (vowels.include?(word[0]) || vowels.include?(word[-1]))
            reversed << word
        else
            reversed << word.reverse
        end
    end
    reversed.join(" ")
end

def hash_missing_keys(hash, *arg)
    arr = []
    if arg.length == 0
        return []
    end
    arg.each do |ele|
            arr << ele if hash.hash_key?(ele) == false
        end
    arr
end
