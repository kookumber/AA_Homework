require "byebug"

def strange_sums(arr)
    counter = 0
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            counter += 1 if i2 > i1 && ele1 + ele2 == 0
        end
    end
    counter
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, product)
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            return true if i2 > i1 && ele1 * ele2 == product
        end
    end
    return false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    #loop through chars and compare again hash to see if key is include
    #if so multiply char by hash key value and add to string and return
    repeats = ""

    str.each_char do |c|
        if hash.key?(c)
            repeats += (c * hash[c])
        else
            repeats += c
        end
    end
    repeats
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    return false if num < 1
    (1..num).each { |i| return true if i * i == num}
    return false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def anti_prime?(num)
    (1...num).each {|i| return false if divisors_count(i) > divisors_count(num)}
    return true
end

def divisors_count(num)
    divisors_list = (1..num).select {|i| num % i == 0}
    divisors_count = divisors_list.length
    divisors_count
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(mat_1, mat_2)
    #loop through mat_1 and loop through mat 2
    #loop through mat_1 and mat_2 eles, if index same, add values
    #shovel to new array

    new_matrix = []
    mat_1.each_with_index do |arr1, idx1|
        sub_matrix = []
        mat_2.each_with_index do |arr2, idx2|
            if idx1 == idx2
                arr1.each_with_index do |ele1, i1|
                    arr2.each_with_index do |ele2, i2|
                        sub_matrix << (ele1 + ele2) if i1 == i2
                    end
                end
            end
        end
        new_matrix << sub_matrix
    end
    new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*num)
    div_arr = []
    num.each {|ele| div_arr << select_divisors(ele)}
    flat_arr = div_arr.flatten
    common_divisors = flat_arr.select {|i| flat_arr.count(i) == num.length}
    common_divisors.uniq
end

def select_divisors(num)
    (1..num).select {|i| num % i == 0}
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num) #1, 1, 2, 4, 7, 13...
    # select last number of sequence that is length of num input
    seq = [1, 1, 2]

    seq = [1] if num == 1
    seq = [1, 1] if num == 2
    
    if num > 3
        (3..num-1).each do |i|
            seq << seq[i-3..i-1].sum
        end
    end
    seq[-1]

end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*mats)
    
    heights = mats.map {|i| i.length}
    widths = []
    mats.each {|ele| widths << ele.length}

    return [heights, widths]
    # return nil if matrix height/width aren't the same

    # mats.max {|ele| ele.length}
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    
    if check_rows(arr) == true
        return true
    elsif check_columns(arr) == true
        return true
    else return false
    end
end

def check_rows(arrays)
    arrays.each do |ele|
        if ele.uniq.length == 1
            return true
        end
    end
end

def check_columns(arrays)
    flattened = arrays.flatten
    range = arrays[0].length - 1
    matches = []
    (0..range).each_with_index do |idx1|
        idxer = [idx1]
        range.times {idxer << idxer[-1] + range + 1 }
        cols = []
        idxer.each {|i| cols << flattened[i]}
        matches << cols.uniq.length
    end
    return matches.min == 1
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(arr)
    diag_1 = []
    diag_2 = []
    size = arr.length
    (0...size).each do |i| 
        diag_1 << [i, i]
        diag_2 << [i, size - 1 - i]
    end

    mid_1 = []
    mid_2 = []

    diag_1.each do |ele|
        mid_1 << arr[ele[0]][ele[1]]
    end

    diag_2.each do |ele|
        mid_2 << arr[ele[0]][ele[1]]
    end

    mid_1.uniq.length == 1 || mid_2.uniq.length == 1

end



# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(num)
    tri = [[1]]
    tri if num == 1
    # debugger
    (0...num).each do |i1|
        block = []
        (0...num).each do |i2|
            if i2 == 0
                block << 1
            else
                block << tri[i1][i2]
            end
        end
        tri << block
    end
    tri
end

# p pascals_triangle(3)

def mersenne_prime(num)
    m_primes = []
    (2..30).each {|i| m_primes << 2 ** i - 1}
    m_primes.select {|ele| prime?(ele)}

end

def prime?(num)
    return false if num < 2
    (2...num).each {|i| return false if num % i == 0 }
    return true
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(str)
    alp = ("a".."z").to_a
    sum = 0
    triangular = false
    str.each_char {|c| sum += alp.index(c)+1}
    (1..sum).each do |i|
        if sum == (i * (i+1))/2
            triangular = true
        end
    end
    return triangular
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false