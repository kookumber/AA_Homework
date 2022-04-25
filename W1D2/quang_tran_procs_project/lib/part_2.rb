def reverser(str, &prc)
    new_str = prc.call(str.reverse)
    new_str
end

def word_changer(str, &prc)
    new_str = []
    str.split(" ").each {|ele| new_str << prc.call(ele)}
    new_str.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    if prc_1.call(num) > prc_2.call(num)
        return prc_1.call(num)
    else
        return prc_2.call(num)
    end
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each {|ele| new_arr << ele if prc_1.call(ele) && prc_2.call(ele)}
    new_arr
end

def alternating_mapper(arr, prc_1, prc_2) #even idx prc_1, odd idx prc_2
    new_arr = []
    arr.each_with_index do |ele, i|
        if i % 2 == 0
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end
    end
    new_arr
end