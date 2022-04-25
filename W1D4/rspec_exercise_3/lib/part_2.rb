def element_count(arr)

    hash = Hash.new(0)
    arr.each {|i| hash[i] += 1}
    hash
end

def char_replace!(str, hash)
    replaced = str
    str.each_char.with_index do |c, i|
        if hash.has_key?(c)
            replaced[i] = hash[c]
        end
    end
    replaced
end

def product_inject(arr)
    arr.inject {|acc, ele| acc * ele}
end