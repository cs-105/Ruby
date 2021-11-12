#writen by Jack Chiplin (10/20/2021)
#last modified by Jack Chiplin (11/11/2021)

class Population
  #populationValues is an array of floats of populations across the different months of the game
  @@populationValues = []
  #month is the index used in the array populationValues, incremented by the user's actions
  @@month = 0
  #startingPopulation is the variable that takes input from the user for the starting population
  #progressAnswer is whether the user answers Yes or No to progress a month in the game
  #lastPopulation is the population at the month the user was previously at in the game
  @@lastPopulation = 0
  #currentPopulation is the population in a tile at the month the user is at in the game
  @@currentPopulation = 0
  #waterQuantity is an integer that specifies how much water is available in a tile for a month
  @@waterQuantity = 1000
  #animalThirst is an integer for how much water each animal needs in a month
  @@animalThirst = 2
  #waterDesired is an integer that is how much water is desired in total in a tile in a month
  @@waterDesired = 0
  #waterDifference is an integer that is how much water animals desire that the tile doesn't have the quantity for
  @@waterDifference = 0
  #deadAnimals is an integer that is how many animals go thirsty in a month who die
  @@deadAnimals = 0
  #populationGrowth is how many animals were born in a month
  @@populationGrowth = 0

  def initialize(startingPopulation)
    @startingPopulation = startingPopulation.to_f
  end

  def dieByThirst
    if(@@month == 0)
      @@waterDesired = @startingPopulation * @@animalThirst
      #determine how much water is desired on a tile in the first month
    else
      @@waterDesired = @@currentPopulation.to_f * @@animalThirst 
      #determine how much water is desired on a tile in a month
    end
    if(@@waterDesired > @@waterQuantity)
    #if quantity does not satisfy all water desired
      @@waterDifference = @@waterDesired - @@waterQuantity
      #find how much water is still desired
      @@deadAnimals = @@waterDifference / @@animalThirst
      #find how many animals die of thirst
    else
      @@deadAnimals = 0
    end
  end

  def appendStartingPopulation
    @@populationValues.unshift(@startingPopulation)#appends startPop to beginning of array
    puts "\nMonth: #{@@month}
    Population: #{@startingPopulation.to_i}
    \n"
  end
  
  def setCurrentPopulation
    if(@@month == 0)
      @@lastPopulation = @startingPopulation
      @@currentPopulation = @@lastPopulation.to_f * ((2.71828) ** 0.1)
      @@populationGrowth = @@currentPopulation - @@lastPopulation
    elsif(@@month > 0)
      @@lastPopulation = @@populationValues[@@month]
      @@currentPopulation = @@lastPopulation.to_f * ((2.71828) ** 0.1)
      @@populationGrowth = @@currentPopulation - @@lastPopulation
    end
    dieByThirst()
    @@currentPopulation = @@currentPopulation - @@deadAnimals
    #subtract animals who die from the tile's current population
    @@populationValues.insert(@@month + 1, @@currentPopulation)
  end
    
  def progressMonth(answer)
    @@month = @@month + 1
    if(answer == 'Y' && @@month > 0)
      puts "\nMonth: #{@@month}
      Previous Population: #{@@populationValues[@@month-1].to_i}
      Animals born: #{@@populationGrowth.to_i}
      Animals died: #{@@deadAnimals.to_i}
      Current Population: #{@@populationValues[@@month].to_i}
      Population Change: #{(@@populationValues[@@month].to_i) - (@@populationValues[@@month-1].to_i)}
      \n"
    end
  end
  
end 

quitAnswer = ""
puts "To quit the simulation, enter 'q'"
puts "Enter a starting population:"
startPopulation = gets.chomp

while(quitAnswer != 'q')
  if(startPopulation != 'q')
    population1 = Population.new(startPopulation)
    population1.appendStartingPopulation
    answer = ""
    while (answer != 'q')
      puts "To progress a month enter 'Y'"
      answer = gets.chomp
      if(answer != 'q')
        population1.setCurrentPopulation
        population1.progressMonth(answer)
      elsif(answer == 'q')
        quitAnswer = 'q'
        puts "Quit simulation"
      end
    end
  elsif(startPopulation == 'q')
    quitAnswer = 'q'
    puts "Quit simulation"
  end
end
