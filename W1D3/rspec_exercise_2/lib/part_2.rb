def palindrome?(str)
    reversed = ""
    i = str.length - 1
    while i >= 0
        reversed += str[i]
        i -= 1
    end
    reversed == str
end

def substrings(str)
    subs = []

    str.each_char.with_index do |char1, idx1|
        str.each_char.with_index do |char2, idx2|
            if idx2 == idx1
                subs << char1
            elsif idx2 > idx1
                subs << str[idx1..idx2]
            end
        end
    end

    subs
end

def palindrome_substrings(str)
    new_arr = substrings(str)
    new_arr.select {|ele| palindrome?(ele) && ele.length > 1}
end