#writen by Jack Chiplin (11/13/2021)
#last modified by Jack Chiplin (12/5/2021)

require 'ascii_chart'
require_relative 'Population.rb'

class Statistics
  @@bunnyList = Population.getBunnyPopulationValues

  @@wolfList = Population.getWolfPopulationValues

  @@defaultOptions = { :offset => 3,
  :format => '%6d',
  :height => 7
  }

  def initialize
    puts "\nBunny Population Growth Over Time\n"
    puts AsciiChart.plot((@@bunnyList), @@defaultOptions)
    puts "\nWolf Population Growth Over Time\n"
    puts AsciiChart.plot((@@wolfList), @@defaultOptions)
  end
  
end