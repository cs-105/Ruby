#written by Jack Chiplin (10/20/2021)
#last modified by Jack Chiplin (10/20/2021)

class Population
  #populationValues is an array of populations across the different months of the game
  @@populationValues = []
  #month is the index used in the array populationValues
  #currentPopulation is the population at the month the user is at in the game
  #lastPopulation is the population at the month the user was previously at in the game
  #startingPopulation is the variable that takes input from the user for the starting population
  
  def initialize(month, currentPopulation, lastPopulation, startingPopulation)
    @month = month
    @currentPopulation = currentPopulation
    @lastPopulation = lastPopulation
    @startingPopulation = startingPopulation    
  end
  
  def setStartingPopulation(startPop)
    @month = 0
    @startingPopulation = startPop
    @@populationValues[month] += startPop
    @currentPopulation = @startingPopulation
  end
  
  def setCurrentPopulation(month)
    @month = month
    @lastPopulation = @@populationValues[month-1]
    @currentPopulation = @lastPopulation * ((2.71828) ^ 0.1)
  end
  
  #Psuedocode:
  #currentPopulation takes the last month's population and uses the population growth formula to get a new population total
  #lastPopulation is the previous month's population
  
  #on month 0
  #startingPopulation = userInput()
  #populationValues.append(startingPopulation)
  #currentPopulation = startingPopulation
  
  #for each month,
  #currentPopulation = lastPopulation * ((2.71828) ^ 0.1)
  
  #month number is equal to the index of the array
end
  
  
