# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(factor)
    return false if factor < 2
    (2...factor).each do |i|
        return false if factor % i == 0
    end
    return true
end

def largest_prime_factor(num)
    divisor = 0
    (2..num).each do |i|
        if num % i == 0 && prime?(i)
            divisor = i
        end
    end
    return divisor
end

def unique_chars?(str)
    str.chars.uniq.length == str.length

end

def dupe_indices(arr)
    hash = Hash.new { |k, v| k[v] = []}
    arr.each_with_index do |ele, i|
        hash[ele] << i
    end
    return hash.select { |k, v| hash[k].length > 1}
end


def ana_array(arr_1, arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    arr_1.each { |ele| hash_1[ele] += 1}
    arr_2.each { |ele| hash_2[ele] += 1}

    hash_1 == hash_2
end


puts ana_array(["a", "b", "c"], ["a", "c", "b"])