#written by Jack Chiplin (10/20/2021)
#last modified by Jack Chiplin (10/22/2021)

class Population
  #populationValues is an array of populations across the different months of the game
  @@populationValues = []
  #month is the index used in the array populationValues, incremented by the user's actions
  @@month = 0
  #startingPopulation is the variable that takes input from the user for the starting population
  #progressAnswer is whether the user answers Yes or No to progress a month in the game
  #lastPopulation is the population at the month the user was previously at in the game
  @@lastPopulation = 0
  #currentPopulation is the population at the month the user is at in the game
  @@currentPopulation = 0
 
  def initialize(startingPopulation, progressAnswer)
    @startingPopulation = startingPopulation
    @progressAnswer = progressAnswer
  end
 
  def setStartingPopulation
    @@populationValues.unshift(@startPopulation) #appends startPop to beginning of array
    #@@currentPopulation = @startingPopulation
  end
  
  def setCurrentPopulation
    @@lastPopulation = @@populationValues[@@month-1]
    @@currentPopulation = @@lastPopulation * ((2.71828) ** 0.1)
  end
    
  def progressMonths
    if(@progressAnswer == "Y")
      @@month = @@month + 1
      @@populationValues.insert(@@month, @@currentPopulation)
      puts "Previous Population: #{@@populationValues[@@month-1]}
      \nCurrent Population: #{@@populationValues[@@month]}
      \nPopulation Change: #{@@populationValues[@@month] - @@populationValues[@@month-1]}"
    else
      @@month = @@month
    end
  end
  
end 
  
puts "Enter a starting population:"
startPopulation = gets.chomp.to_i
puts "To progress a month enter 'Y'"
answer = gets.chomp.to_i

population1 = Population.new(startPopulation, answer)

  #print current population after each progressed month

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





