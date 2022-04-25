require "byebug"

def proper_factors(num)
    (1...num).select {|i| num % i == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(num)
    ideal_arr = []
    (1..2000).each {|i| ideal_arr << i if perfect_number?(i)}
    ideal_arr[0...num]
end