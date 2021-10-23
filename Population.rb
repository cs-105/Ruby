#written by Jack Chiplin (10/20/2021)
#last modified by Jack Chiplin (10/22/2021)

class Population
  #populationValues is an array of populations across the different months of the game
  @@populationValues = []
  #month is the index used in the array populationValues, incremented by the user's actions
  #currentPopulation is the population at the month the user is at in the game
  #lastPopulation is the population at the month the user was previously at in the game
  #startingPopulation is the variable that takes input from the user for the starting population
  
  def initialize(month, currentPopulation, lastPopulation, startingPopulation)
    @month = month
    @currentPopulation = currentPopulation
    @lastPopulation = lastPopulation
    @startingPopulation = startingPopulation    
  end
  
  def getMonth
    return(@month)
  end
  
  def getCurrentPopulation
    return(setCurrentPopulation(@month))
  end
  
  def getLastPopulation
    @lastPopulation = @@populationValues[@month-1]
  end
  
  def getStartingPopulation
    #get user input for starting pop
    #call setStartingPopulation with user input and put its value in a variable
    return(@startingPopulation)
  end
  
  def setMonth(month)
    #user clicks next month and last month appended by 1 and that value put into month variable
    #@month = something
  end
 
  def setStartingPopulation(startPop)
    #@month = 0 (may not matter)
    @startingPopulation = startPop
    #@@populationValues[month] += startPop maybe not the place to do this
    #@currentPopulation = @startingPopulation (maybe not neccessary)
  end
  
  def setCurrentPopulation(month)
    @month = month
    @currentPopulation = @lastPopulation * ((2.71828) ** 0.1)
  end
  
  def appendStartingPopulation
    @@populationValues.unshift(@startingPopulation) #append startPop to the beginning of the array
  end
  
  def appendPopulationByMonth
    #call getCurrentPopulation
    #now have starting population at index 0 in array and current population (by month)
    #append each current population to the array as the months increment in the game  
  end
    
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
  
  #Possible edge cases:
    #Within setCurrentPopulation, may need error catching with months to not be less than 0



#To Do:
  #1 tile, 1 species for now, but try to allow for expansion to more species and tiles later
  #Create an object that contains data for rabbits that gets put into the array at every month 
  #Array gets updated and new populations put into the array for a new month
  
  #Figure out how the user can input starting population and increment the months in the game
  
  #May need to add get methods for each variable





