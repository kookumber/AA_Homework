def hipsterfy(str)
    str.reverse.sub(/[aeiou]/, "").reverse
end

def vowel_counts(str)
    hash = Hash.new(0)
    str.downcase.each_char { |char| hash[char] += 1 if "aeiou".include?(char)}
    return hash
end

def caesar_cipher(msg, num)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    cipher = ""
    msg.downcase.each_char do |char|
        if alphabet.include?(char)
            idx = (alphabet.index(char) + num) % 26
            cipher += alphabet[idx]
        else
            cipher += char
        end
    end
    return cipher
end

