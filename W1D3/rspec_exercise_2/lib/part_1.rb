require "byebug"

def partition(arr, num)
   new_arr = []
   new_arr << arr.select {|ele| ele < num}
   new_arr << arr.select {|ele| ele >= num}
   new_arr
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each {|k, v| new_hash[k] = v}
    hash_2.each {|k, v| new_hash[k] = v}
    new_hash
end

def censor(sent, curse_arr)
    new_sent = []
    sent.split(" ").each do |word|
        new_word = ""
        if curse_arr.include?(word.downcase)
            word.each_char do |c|
                if 'aeiou'.include?(c.downcase)
                    new_word += "*"
                else
                    new_word += c
                end
            end
            new_sent << new_word
        else
            new_sent << word 
        end
    end
    new_sent.join(" ")
end

def power_of_two?(num)
    (0..25).each do |i|
        count = 2**i
        if count == num
            return true
        end
    end
    
    return false

end