#writen by Jack Chiplin (11/11/2021)
#last modified by Jack Chiplin (11/12/2021)

#Given the current population on a tile
#Allocate water to each animal to satisfy their thirst
#Animals who do not have their thirst satisfied will die

#every month look at waterQuanity and subtract waterConsumed from that updates waterQuantity
#every new month waterQuantity = waterCapacity

#To Do:
#Allow change in populations to affect water consumption

class Water
  #waterQuantity is actual amount of water in a tile
  @@waterQuantity = 0
  #waterConsumed is amount of water that animals have drank per month
  @@waterConsumed = 0
  #month is the integer incremented by the user's actions
  @@month = 0

  def initialize(waterCapacity, wolfLocalPopulation, bunnyLocalPopulation, animalThirst)
    @waterCapacity = waterCapacity.to_i
    #waterCapacity is total amount of water the tile can support
    @wolfLocalPopulation = wolfLocalPopulation.to_i
    #wolfLocalPopulation is hardcoded for now
    @bunnyLocalPopulation = bunnyLocalPopulation.to_i
    #bunnyLocalPopulation is hardcoded for now
    @animalThirst = animalThirst.to_i
    #animalThirst is an integer for how much water each animal needs in a month
    puts "\nMonth: #{@@month}
    WaterQuantity: #{waterCapacity}
    \n"


  end

  def updateWaterQuantity(answer)
    @@month = @@month + 1
    if(answer == 'Y' && @@month > 0)
      @@waterQuantity = @waterCapacity
      #set waterQuantity to waterCapacity at start of every month
      @@waterConsumed = (@wolfLocalPoplation.to_i + @bunnyLocalPopulation.to_i) * @animalThirst
      #water consumed set to how much the total population of animals are thirsty
      @@waterQuantity = @@waterQuantity - @@waterConsumed
      #subtract waterConsumed from waterQuantity to get new waterQuantity
      puts "\nMonth: #{@@month}
      Water Quantity: #{@@waterQuantity}
      \n"
    end
  end

end

#1000, 50, 400, 2

quitAnswer = ""
puts "To quit the simulation, enter 'q'"
puts "Enter a Water Capacity"
waterCapacity = gets.chomp
puts "Enter a Local Population for Wolves"
wolfLocalPopulation = gets.chomp
puts "Enter a Local Population for Bunnies"
bunnyLocalPopulation = gets.chomp
puts "Enter an Animal Thirst Level"
animalThirst = gets.chomp

while(quitAnswer != 'q') 
  if((waterCapacity && wolfLocalPopulation &&  bunnyLocalPopulation && animalThirst) != 'q')
    tile1 = Water.new(waterCapacity,wolfLocalPopulation, bunnyLocalPopulation, animalThirst)
    answer = ""
    while (answer != 'q')
      puts "To progress a month enter 'Y'"
      answer = gets.chomp
      if(answer != 'q')
        tile1.updateWaterQuantity(answer)
      elsif(answer == 'q')
        quitAnswer = 'q'
        puts "Quit simulation"
      end
    end
  elsif((waterCapacity || wolfLocalPopulation ||  bunnyLocalPopulation || animalThirst) == 'q')
    quitAnswer = 'q'
    puts "Quit simulation"
  end
end

