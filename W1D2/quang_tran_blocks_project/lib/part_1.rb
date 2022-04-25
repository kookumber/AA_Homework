def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|ele| ele["age"] < 3}
end

def count_positive_subarrays(arr)
    arr.count {|ele| ele.sum > 0 }
end

def aba_translate(str)
    new_str = ""
    str.each_char do |c|
        if 'aeiou'.include?(c)
            new_str += c + "b" + c
        else
            new_str += c
        end
    end
    new_str
end

def aba_array(arr)
    arr.map {|ele| aba_translate(ele)}
end