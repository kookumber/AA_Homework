def is_prime?(num)
    return false if num < 2

    (2...num).each {|i| return false if num % i == 0}

    return true
end

def nth_prime(num)
    arr = [2]

    while arr.length < num
        (3..4000).each {|i| arr << i if is_prime?(i)}
    end

    arr[num-1]
end

def prime_range(min, max)

    arr = []
    (min..max).each { |i| arr << i if is_prime?(i)}
    arr
end