#written by Jack Chiplin (10/20/2021)
#last modified by Jack Chiplin (10/23/2021)

class Population
  #populationValues is an array of floats of populations across the different months of the game
  @@populationValues = []
  #month is the index used in the array populationValues, incremented by the user's actions
  @@month = 0
  #startingPopulation is the variable that takes input from the user for the starting population
  #progressAnswer is whether the user answers Yes or No to progress a month in the game
  #lastPopulation is the population at the month the user was previously at in the game
  @@lastPopulation = 0
  #currentPopulation is the population at the month the user is at in the game
  @@currentPopulation = 0
 
  def initialize(startingPopulation)
    @startingPopulation = startingPopulation
  end
 
  def appendStartingPopulation
    @@populationValues.unshift(@startingPopulation.to_f)#appends startPop to beginning of array
    #puts @@populationValues.inspect #(for debugging)
    puts "Month: #{@@month}"
    puts "Population: #{@startingPopulation.to_i}"
  end
  
  def setCurrentPopulation
    if(@@month == 0)
      @@lastPopulation = @startingPopulation
      @@currentPopulation = @@lastPopulation.to_f * ((2.71828) ** 0.1)
    elsif(@@month > 0)
      @@lastPopulation = @@populationValues[@@month]
      @@currentPopulation = @@lastPopulation.to_f * ((2.71828) ** 0.1)
    end
    @@populationValues.insert(@@month + 1, @@currentPopulation)
  end
    
  def progressMonth(answer)
    @@month = @@month + 1
    if(answer == 'Y' && @@month > 0)
      puts "Month: #{@@month}"
      puts "Previous Population: #{@@populationValues[@@month-1].to_i}
      \nCurrent Population: #{@@populationValues[@@month].to_i}
      \nPopulation Change: #{(@@populationValues[@@month] - @@populationValues[@@month-1]).to_i}"
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

#Specifications:

#1 tile, 1 species for now, but try to allow for expansion to more species and tiles later
#Create an object that contains data for rabbits that gets put into the array at every month 
#Array gets updated and new populations put into the array for a new month
  
#Figure out how the user can input starting population and increment the months in the game
