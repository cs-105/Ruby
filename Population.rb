#writen by Jack Chiplin (10/20/2021)
#last modified by Jack Chiplin (12/4/2021)

require_relative 'Grid.rb'

class Population
  #wolfPopulationValues is an array of populations across the different months of the game for wolves
  @@wolfPopulationValues = []
  #bunnyPopulationValues is an array of populations across the different months of the game for bunnies
  @@bunnyPopulationValues = []
  #month is the index used in the array populationValues,incremented by the user's actions
  @@month = 0
  #lastWolfPopulation is the population of wolves at the month the user was previously at in the game
  @@lastWolfPopulation = 0
  #currentWolfPopulation is the population of wolves in a tile at the month the user is at in the game
  @@currentWolfPopulation = 0
  #lastBunnyPopulation is the population of bunnies at the month the user was previously at in the game
  @@lastBunnyPopulation = 0
  #currentBunnyPopulation is the population of bunnies in a tile at the month the user is at in the game
  @@currentBunnyPopulation = 0
  #waterQuantity is an integer that specifies how much water is available in a tile for a month
  @@waterQuantity = 500
  #animalThirst is an integer for how much water each animal needs in a month
  @@animalThirst = 2
  #waterDifference is an integer that is how much water animals desire that the tile doesn't have the quantity for
  @@waterDifference = 0
  #deadAnimals is an integer that is how many animals go thirsty in a month who die
  @@deadAnimals = 0
  #deadWolves is an integer that is how many wolves go thirsty in a month who die
  @@deadWolves = 0
  #deadBunnies is an integer that is how many bunnies go thirsty in a month who die
  @@deadBunnies = 0
  #wolfPopulationGrowth is how many wolves were born in a month
  @@wolfPopulationGrowth = 0
  #bunnyPopulationGrowth is how many wolves were born in a month
  @@bunnyPopulationGrowth = 0
  #newWolfPopulation is an intermediate variable used in animalGrowth
  @@newWolfPopulation = 0
  #newBunnyPopulation is an intermediate variable used in animalGrowth
  @@newBunnyPopulation = 0
  #waterDesiredByWolves is an integer that holds how much water wolves want to drink
  @@waterDesiredByWolves = 0
  #waterDesiredByBunnies is an integer that holds how much water bunnies want to drink
  @@waterDesiredByBunnies = 0
  #waterDesired is the sum of water desired by bunnies and wolves
  @@waterDesired = 0
  
  

  def initialize(bunnyStartingPopulation, wolfStartingPopulation, gridHeight, gridWidth)
    @wolfStartingPopulation = wolfStartingPopulation.to_f
    @bunnyStartingPopulation = bunnyStartingPopulation.to_f
    @gridHeight = gridHeight
    @gridWidth = gridWidth
    
    #gameGrid is the grid of Land objects
    @gameGrid = Grid.new(@gridHeight, @gridWidth, Array[@bunnyStartingPopulation, @wolfStartingPopulation])
    @gameGrid.output
  end

  def dieByThirst
    if(@@month == 0)
      @@waterDesiredByWolves = @wolfStartingPopulation * @@animalThirst
      #determine how much water is desired by wolves on a tile in the first month
      @@waterDesiredByBunnies = @bunnyStartingPopulation * @@animalThirst
      #determine how much water is desired by bunnies on a tile in the first month
    elsif(@@month > 0)
      @@waterDesiredbyWolves = @@lastWolfPopulation * @@animalThirst 
      #determine how much water is desired by wolves on a tile in a month
      @@waterDesiredbyBunnies = @@lastBunnyPopulation * @@animalThirst 
      #determine how much water is desired by bunnies on a tile in a month
    end
    @@waterDesired = @@waterDesiredByWolves + @@waterDesiredByBunnies
    if(@@waterDesired > @@waterQuantity)
    #if quantity does not satisfy all water desired
      @@waterDifference = @@waterDesired - @@waterQuantity
      #find how much water is still desired
      @@deadAnimals = @@waterDifference / @@animalThirst
      #find how many animals die of thirst
      @@deadWolves = @@deadAnimals * (@@currentWolfPopulation/((@@currentWolfPopulation + @@currentBunnyPopulation) + 0.01))
      #find how many wolves die of thirst
      @@deadBunnies = @@deadAnimals * (@@currentBunnyPopulation/((@@currentWolfPopulation + @@currentBunnyPopulation) + 0.01))
      #find how many bunnies die of thirst
    end
  end

  def popAnimalGrowth()

    if(@@month == 0)
      @@lastWolfPopulation = @wolfStartingPopulation
      @@lastBunnyPopulation = @bunnyStartingPopulation
    elsif(@@month > 0)
      @@lastWolfPopulation = @@wolfPopulationValues[@@month]
      @@lastBunnyPopulation = @@bunnyPopulationValues[@@month]
    end
=begin
    @@newWolfPopulation = @@lastWolfPopulation * ((2.71828) ** 0.1)
    @@wolfPopulationGrowth = @@newWolfPopulation - @@lastWolfPopulation
    #calculate growth for wolves in first month
    @@newBunnyPopulation = @@lastBunnyPopulation * ((2.71828) ** 0.1)
    @@bunnyPopulationGrowth = @@newBunnyPopulation - @@lastBunnyPopulation
    #calculate growth for bunnies in first month
=end
    #JOSHREWORK
    popchanges = @gameGrid.animalGrowth
    @@bunnyPopulationGrowth = popchanges[0]
    @@wolfPopulationGrowth = popchanges[1]
  end

  def appendStartingPopulation
    @@wolfPopulationValues.unshift(@wolfStartingPopulation) 
    #appends starting wolf population to beginning of array
    @@bunnyPopulationValues.unshift(@bunnyStartingPopulation) 
    #appends starting wolf population to beginning of array
    puts "\nMonth: #{@@month}
    Bunny Population: #{@bunnyStartingPopulation.to_i}
    Wolf Population: #{@wolfStartingPopulation.to_i}
    \n"
  end
  
  def setCurrentPopulation
    #JOSHNOTE animalGrowth and dieByThirst will need to be modified to make calls to grid functions
    popAnimalGrowth()
    dieByThirst()
    @@currentWolfPopulation = ((@@lastWolfPopulation - @@deadWolves) + @@wolfPopulationGrowth).to_i
    @@currentBunnyPopulation = ((@@lastBunnyPopulation - @@deadBunnies) + @@bunnyPopulationGrowth).to_i
    #subtract animals who die from thirst from the tile's current population and add those born
    @@wolfPopulationValues.insert(@@month + 1, @@currentWolfPopulation)
    @@bunnyPopulationValues.insert(@@month + 1, @@currentBunnyPopulation)
  end
    
  def progressMonth(answer)
    @@month = @@month + 1
    @gameGrid.output
    if((answer == 'Y' || 'y') && (@@month > 0) && (@@wolfPopulationValues[@@month] + @@bunnyPopulationValues[@@month] > 0))
      puts "\nMonth: #{@@month}
      Previous Bunny Population: #{@@bunnyPopulationValues[@@month-1].to_i}
      Previous Wolf Population: #{@@wolfPopulationValues[@@month-1].to_i}
      Bunnies born: #{@@bunnyPopulationGrowth.to_i}
      Wolves born: #{@@wolfPopulationGrowth.to_i}
      Bunnies dead by thirst: #{@@deadBunnies.to_i}
      Wolves dead by thirst: #{@@deadWolves.to_i}
      Current Bunny Population: #{@@bunnyPopulationValues[@@month].to_i}
      Current Wolf Population: #{@@wolfPopulationValues[@@month].to_i}
      Bunny Population Change: #{(@@bunnyPopulationValues[@@month].to_i) - (@@bunnyPopulationValues[@@month-1].to_i)}
      Wolf Population Change: #{(@@wolfPopulationValues[@@month].to_i) - (@@wolfPopulationValues[@@month-1].to_i)}
      \n"
    elsif(@@wolfPopulationValues[@@month] + @@bunnyPopulationValues[@@month] == 0)
      puts "All animals dead. Game over."
    end
  end
  
end 
