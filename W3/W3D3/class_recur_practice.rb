
#sum numbers from 1 to n recursively
def rec_sum(n) 
    return 1 if n == 1
    n + rec_sum(n-1)
end

# p rec_sum(5)

def rec_reverse(string)
    return string if string.length == 1
    rec_reverse(string[1..-1]) + string[0]
end

# p rec_reverse("cat")

def fibs(n)
    return 1 if n == 1
    return 1 if n == 2

    fibs(n-1) + fibs(n-2)
end

def all_fibs(n)
    
    return [] if n == 0
    return [0] if n == 1 
    return [0, 1] if n == 2
    
    arr = []
    # all_fibs(n - 1) << all_fibs(n - 1)[-1] + all_fibs(n - 1)[-2]
    all_fibs(n - 1) << all_fibs(n - 1)[-2..-1].sum
end

# p all_fibs(7)

def binary_search(arr, target)
    return nil if arr.length == 0
    mid = arr.length / 2
    return mid if arr[mid] == target

    left_half = arr[0...mid]
    right_half = arr[mid..-1]

    if arr[mid] < target
        binary_search(right_half, target) + left_half.length
    else
        binary_search(left_half, target)
    end
end

p binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 10)