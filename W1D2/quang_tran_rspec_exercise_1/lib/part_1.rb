def average(num_1, num_2)
    return (num_1 + num_2) / 2.0
end

def average_array(arr)
    return (arr.sum(0.0) / arr.length)
end

def repeat(str, num)
    return str * num
end

def yell(str)
    word = ""
    word += str.upcase + "!"
    return word
end

def alternating_case(sent)
   words = sent.split(" ")
   alternated = []
   words.each_with_index do |ele, i|
        if i % 2 == 0
            alternated << ele.upcase
        else
            alternated << ele.downcase
        end
   end
   return alternated.join(" ")
end

