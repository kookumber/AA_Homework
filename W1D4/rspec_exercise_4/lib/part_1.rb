def my_reject(arr, &block)
    arr.select {|ele| block.call(ele) == false}
end

def my_one?(arr, &block)
    count = 0
    arr.each {|ele| count +=1 if block.call(ele) == true}
    count == 1
end

def hash_select(hash, &block)
    new_hash = {}
    hash.each {|k, v| new_hash[k] = v if block.call(k, v) == true}
    new_hash
end

def xor_select(arr, prc_1, prc_2)
    new_arr = []

    arr.each do |ele|
        if (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))
           new_arr << ele 
        end
    end
    new_arr
end

def proc_count(num, procs)
    true_count = 0
    procs.each {|proc| true_count +=1 if proc.call(num)}
    true_count
end