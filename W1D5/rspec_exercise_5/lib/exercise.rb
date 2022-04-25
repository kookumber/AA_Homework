require "byebug"

def zip(*arr)
    zipped = []
    # debugger
    range = arr[0].length

    (0...range).each do |i|
        sub_arr = []
        arr.each do |ele|
            sub_arr << ele[i]
        end
        zipped << sub_arr
    end
    zipped
end

def prizz_proc(arr, prc_1, prc_2)
    new_arr = []

    arr.each do |ele|
        if (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))
           new_arr << ele 
        end
    end
    new_arr
end

def zany_zip(*arr)
    max_length = arr[0].length
    arr.each {|ele| max_length = ele.length if ele.length > max_length}

    zipped = []

    (0...max_length).each do |i|
        sub_arr = []
        arr.each do |ele|
            sub_arr << ele[i]
        end
        zipped << sub_arr
    end
    zipped
end

def maximum(arr, &prc)
    # returns nil if arr is empty
    return nil if arr.none?

    len_count = 0
    idx = 0

    arr.each_with_index do |ele, i|
        if prc.call(ele) >= len_count
            len_count = prc.call(ele)
            idx = i
        end
    end

    arr[idx]
end

def my_group_by(arr, &block)

    hash = Hash.new {|h, k| h[k] = []}

    arr.each do |ele|
        value = block.call(ele)
        hash[value] << ele
    end
    hash
end

def max_tie_breaker(arr, prc, &block)
    # return largest of block
    # if tied, return largest of prc
    # if tied, return first element
    return nil if arr.length == 0 #return nil if arr is empty
    
    new_ele = ""

    block_arr = arr.map {|ele| block.call(ele)}
    if block_arr.count(block_arr.max) == 1
        return arr[block_arr.index(block_arr.max)]
    else
        block_arr = arr.map {|ele| [proc.call(ele)]}
        if block_arr.count(block_arr.max) == 1
            return arr[block_arr.index(block_arr.max)]
        else
            return 
        end
    end
end

# arr = ['potato', 'swimming', 'cat']
# proc = Proc.new { |s| s.count('o') }

# p max_tie_breaker(arr, proc) { |s| s.length }

def silly_syllables(sent)
    words = sent.split
    new_words = []
    words.each_with_index do |word, i|
        vowel_idxer = []
        word.each_char.with_index {|c, idx| vowel_idxer << idx if "aeiouAEIOU".include?(c)}
        if vowel_idxer.length < 2
            new_words << word
        else
            new_words << word[vowel_idxer[0]..vowel_idxer[-1]]
        end
    end
    new_words.join(" ")
end

p silly_syllables('properly and precisely written code')