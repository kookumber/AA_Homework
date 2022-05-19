require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "gordon") }
  # let(:chef) { Chef.new("Gordon") }
  subject(:cake) { Dessert.new("cake", 10, "gordon")}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq('cake')
    end
    it "sets a quantity" do
      expect(cake.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "ten", "gordon") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient('flour')
      expect(cake.ingredients).to include("flour")
    end
  end 

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "eggs", "milk", "sugar"]
      ingredients.each { |ingredient| cake.add_ingredient(ingredient) }
      cake.mix!
      expect(cake.ingredients).not_to eq(ingredients)
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(1)
      expect(cake.quantity).to eq(9)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cake.serve).to eq("Gordon has made 10 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
