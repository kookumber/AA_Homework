def all_words_capitalized?(arr)
    arr.all? {|ele| ele == ele.capitalize}
end

def no_valid_url?(arr)
    arr.none? {|ele| ele.include?('.com')}
end

def any_passing_students?(students)
    students.any? {|ele| ele[:grades].sum / ele[:grades].length > 75}
end # why wouldn't ele["grades"] call the value for grades but ele[:grades] does
