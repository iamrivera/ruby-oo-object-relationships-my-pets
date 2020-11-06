require 'pry'

class Owner
  attr_accessor :pets

  @@all = []

 def initialize(name, species = "human")
  @name = name
  @species = species
  @@all << self
 end

  def name 
    @name
  end

  def species 
    @species
  end

  def say_species 
    "I am a #{@species}."
  end

  def self.all 
    @@all 
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    # binding.pry
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    # binding.pry
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    # binding.pry
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    # binding.pry
    @pets = self.dogs + self.cats 

    @pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end