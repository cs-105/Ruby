#last modified by Joshua Cross (11/26/2021)
#last modified by Jack Chiplin (12/5/2021)
#require 'sinatra'
require_relative 'test.rb'
require_relative 'Grid'
require_relative 'Population.rb'
require_relative 'Statistics.rb'

#set :protection, :except => :frame_options
#set :bind, '0.0.0.0'
#set :port, 8080
#Josh here, the next line is a call to my test code. It can be commented out when not testing my code
#joshTestFunction
#test = Grid.new(10,10,Array[40, 6])

#Jack's test
quitAnswer = ""
puts "To quit the simulation, enter 'q'"
puts "Enter height of ecostystem grid:"
gridHeight = gets.chomp.to_i

while(quitAnswer != 'q')
  if(gridHeight != 'q')
    puts "Enter width of ecosystem grid: (Expand window for larger widths)"
    gridWidth = gets.chomp.to_i
    if(gridWidth != 'q')
      puts "Enter a starting population for bunnies:"
      bunnyStartPopulation = gets.chomp.to_i
      if(bunnyStartPopulation != 'q')
        puts "Enter a starting population for wolves:"
        wolfStartPopulation = gets.chomp.to_i
        if (wolfStartPopulation != 'q')
          population1 = Population.new(bunnyStartPopulation, wolfStartPopulation, gridHeight, gridWidth)
          population1.appendStartingPopulation
          answer = ""
          while (answer != 'q' && Population.getAnyLife)
            puts "To progress a month enter 'Y' or 'y'"
            answer = gets.chomp
            if(answer != 'q')
              population1.setCurrentPopulation
              population1.progressMonth(answer)
            elsif(answer == 'q')
              graph = Statistics.new
              quitAnswer = 'q'
              puts "\nQuit simulation"
            end
          end
        elsif(bunnyStartPopulation == 'q')
          quitAnswer = 'q'
          puts "Quit simulation"
        end
      elsif(wolfStartPopulation == 'q')
        quitAnswer = 'q'
        puts "Quit simulation"
      end
    elsif(gridWidth == 'q')
      quitAnswer = 'q'
      puts "Quit simulation"
    end
  elsif(gridHeight == 'q')
    quitAnswer = 'q'
    puts "Quit simulation"
  end
end

#get '/' do
#  'Window that simulation will run in... This is a rough prototype and will be updated as project goes on.'
#end
