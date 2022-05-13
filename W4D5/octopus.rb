
fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

def sluggish_octopus(arr)
    ele = ""
    arr.each do |word1|
        arr.each do |word2|
            ele = word1 if word1.length > ele.length
            ele = word2 if word2.length > ele.length
        end
    end
    ele
end

p sluggish_octopus(fish_arr)

def clever_octopus(arr)
    fish = arr[0]
    arr.each { |ele| fish = ele if ele.length > fish.length }
    fish
end

p clever_octopus(fish_arr)

#Dancing Octopus -----------------

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, arr)
    arr.each_with_index { |ele, i| return i if ele == direction }
end

p slow_dance("right-down", tiles_array)

hash = Hash.new(0)
tiles_array.each_with_index { |ele, i| hash[ele] += i}
            
def fast_dance(direction, hash)
    hash[direction]
end

p fast_dance("left-up", hash)