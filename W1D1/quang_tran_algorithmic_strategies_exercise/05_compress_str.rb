# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    str_arr = str.chars
    str_arr = str_arr.chunk { |c| c }
    str_arr = str_arr.map { |c, a| [c, a.size]}
    # return str_arr
    new_str = ""
    str_arr.each_with_index do |ele_1, idx_1|
        if ele_1[1] > 1
            new_str += ele_1[1].to_s + ele_1[0]
        else
            new_str += ele_1[0]
        end
    end

    return new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
