# Define your methods here.
require 'byebug'

def string_map!(str, &block)
    str.each_char.with_index do |c, i|
        str[i] = block.call(c)
    end

    str
end

def three?(arr, &block)
    count = 0
    arr.each {|ele| count +=1 if block.call(ele)}
    count == 3
end

def nand_select(arr, prc1, prc2)
    new_arr = []
    arr.each {|ele| new_arr << ele if !(prc1.call(ele) && prc2.call(ele))}
    new_arr
end

def hash_of_array_sum(hash) #hashes contain array
    sum = 0
    hash.each {|k, v| sum += v.sum}
    sum
end

def abbreviate(sent)
    words = sent.split
    new_words = []

    words.each do |word|
        if word.length > 4
            new_word = ""
            word.each_char.with_index do |c, i|
                if "aeiouAEIOU".include?(c)
                    new_word += ""
                else
                    new_word += c
                end
            end
            new_words << new_word
        else
            new_words << word
        end
    end

    new_words.join(" ")
end

def hash_selector(hash, *args)
    new_hash = {}

    if args.length == 0
        return hash
    else
        args.each do |ele|
            if hash.has_key?(ele)
                new_hash[ele] = hash[ele]
            end
        end
    end
    new_hash
end