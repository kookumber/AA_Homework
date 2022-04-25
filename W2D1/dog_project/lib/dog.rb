class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    #------ getter methods ------#
    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def bark
        if self.age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    #------ other instance methods ------#
    def age=(num)
        @age = num
    end

    def favorite_food?(food)
        fav_foods_arr = @favorite_foods.map {|ele| ele.downcase}
        fav_foods_arr.include?(food.downcase)
    end
end

my_dog = Dog.new("Fido", "German Shepard", 3, "Bork!", ["Bacon", "Chicken"])
