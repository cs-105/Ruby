#writen by Joshua Cross (11/26/2021)
#last modified by Joshua Cross (11/26/2021)
#last modified by Jack Chiplin (12/4/2021)
#purpose: demonstrate how to create the game grid and interact with it


require_relative 'Species.rb'
require_relative 'Land.rb'
require 'rainbow'

class Grid
  def initialize(height, width, speciesPops)
    @height = height
    @width = width
    @speciesPops = speciesPops
    #init RNG
    rng = Random.new

    #create a species array template
    speciesArray = Array.new
    #speciesArray.push(BunnySpecies.new(0, 5, 5, 2, 0)) #the arguements are: speciesID, consumptionLevel, consumptionAmount, reproductionRate, localPopulation
    #speciesArray.push(WolfSpecies.new(1, 5, 5, 2, 0))

   # [[0], [0], [0],
   # [0], [0], [0],
   # [0], [0], [0]]

  #create population matrix
    i = 0
    @popGrid = Array.new
    #initial grid array
    while i < height
      j = 0
      @popGrid.push(Array.new)
      #print "["
      #add rows to the grid
      while j < width
        k = 0
        @popGrid[i].push(Array.new)
        #add collumns to the grid
        while k < speciesPops.length
          @popGrid[i][j].push(0)
          k = k + 1
        end
        j = j + 1
      end
      i = i + 1
    end

    #create the actual back end grid of Land objects
    curSpecies = 0
    #puts("@popGrid is #{@popGrid.to_s}")
    while (curSpecies < speciesPops.length)
      curPop = speciesPops[curSpecies]
      while (curPop > 0)
        ord = rng.rand(height * width)
        #puts(ord / width)
        #puts(ord % width)
        #puts(curSpecies)
        @popGrid[ord / width][ord % width][curSpecies] += 1
        #puts("curSpecies is #{curSpecies.to_s}")
        #puts("curPop is #{curPop.to_s}")
        #puts("@popGrid is #{@popGrid.to_s}")
        curPop -= 1
      end
      curSpecies = curSpecies + 1
    end
    #puts("@popGrid is #{@popGrid.to_s}")

    #begin initializing the grid
    @grid = Array.new(height)

    rowIter = 0
    while (rowIter < @grid.length)
      @grid[rowIter] = Array.new(width)
      columnIter = 0
      while (columnIter < @grid[rowIter].length)
        
        
        # the species are still rather hard coded, this will need to be fixed

        @grid[rowIter][columnIter] = Land.new([BunnySpecies.new(0, 5, 5, 2, 0), WolfSpecies.new(1, 5, 5, 2, 0)], 5, 100)
        #puts("rowIter is #{rowIter}, and columnIter is #{columnIter}")
        speciesIter = 0
        while (speciesIter < @grid[rowIter][columnIter].getSpecies.length)
          <<-DOC
          puts("grid copy \n\n\n\n\n\n")
          puts("@grid")
          puts(@grid[rowIter][columnIter].getSpecies[speciesIter])
          puts("@popGrid")
          puts(@popGrid[rowIter][columnIter][speciesIter])
          DOC
          @grid[rowIter][columnIter].getSpecies[speciesIter].setLocalPopulation(@popGrid[rowIter][columnIter][speciesIter])
          <<-DOC
          puts("@grid")
          puts(@grid[rowIter][columnIter].getSpecies[speciesIter])
          DOC
          speciesIter += 1
        end
#        speciesArray[0].setLocalPopulation(0)
#        speciesArray[1].setLocalPopulation(0)
        columnIter += 1
      end
      rowIter += 1
    end
    #puts(@grid)
    #puts(@grid[0][0].getSpecies[0].getGlobalPopulation.to_s)
  end

  def output
    puts "\n"
  #create population matrix output
    i = 0
    #initial grid array
    while i < @height
      j = 0
      #add rows to the grid
      while j < @width
        k = 0
        print " ["
        #add collumns to the grid
        while k < @speciesPops.length
          if(k == 0)
            if (((@grid[i][j].getSpecies[0].getLocalPopulation.to_i).to_s).length  == 1)
              print Rainbow("B:#{(@grid[i][j].getSpecies[0].getLocalPopulation).to_i}     ").aqua #3 spaces
            elsif (((@grid[i][j].getSpecies[0].getLocalPopulation.to_i).to_s).length  == 2)
              print Rainbow("B:#{(@grid[i][j].getSpecies[0].getLocalPopulation).to_i}    ").aqua #2 spaces
            elsif (((@grid[i][j].getSpecies[0].getLocalPopulation.to_i).to_s).length  == 3)
              print Rainbow("B:#{(@grid[i][j].getSpecies[0].getLocalPopulation).to_i}   ").aqua #1 space
            #print Rainbow("B:#{(@grid[i][j].getSpecies[0].getLocalPopulation).to_i} ").aqua
            end
          else
            if (((@grid[i][j].getSpecies[1].getLocalPopulation.to_i).to_s).length  == 1)
              print Rainbow("W:#{(@grid[i][j].getSpecies[1].getLocalPopulation).to_i}   ").red #3 spaces
            elsif (((@grid[i][j].getSpecies[1].getLocalPopulation.to_i).to_s).length  == 2)
              print Rainbow("W:#{(@grid[i][j].getSpecies[1].getLocalPopulation).to_i}  ").red #2 spaces
            elsif (((@grid[i][j].getSpecies[1].getLocalPopulation.to_i).to_s).length  == 3)
              print Rainbow("W:#{(@grid[i][j].getSpecies[1].getLocalPopulation).to_i} ").red #1 space
            end
            #print Rainbow("W:#{(@grid[i][j].getSpecies[1].getLocalPopulation).to_i}").red
          end
          k = k + 1
        end
        j = j + 1
        print "] "
      end
      i = i + 1
      print "\n"
    end
  end

  def animalGrowth
    initIter = 0
    oldGlobalPops = Array.new
    while (initIter < @grid[0][0].getSpecies.length)
      oldGlobalPops.push(@grid[0][0].getSpecies[initIter].getGlobalPopulation)
      initIter = initIter + 1
    end
    rowIter = 0
    while (rowIter < @grid.length)
      columnIter = 0
      while (columnIter < @grid[rowIter].length)
        focusID = 0
        while (focusID < @grid[rowIter][columnIter].getSpecies.length)
          lastPop = @grid[rowIter][columnIter].getSpecies[focusID].getLocalPopulation
          @grid[rowIter][columnIter].getSpecies[focusID].setLocalPopulation(lastPop * ((2.71828) ** 0.1))
          focusID = focusID + 1
        end
        columnIter = columnIter + 1
      end
      rowIter = rowIter + 1
    end
    globalPopGrowths = Array.new(oldGlobalPops.length)
    cleanIter = 0
    while (cleanIter < oldGlobalPops.length)
      #puts(@grid[rowIter].to_s)
      globalPopGrowths[cleanIter] = @grid[0][0].getSpecies[cleanIter].getGlobalPopulation - oldGlobalPops[cleanIter] 
      cleanIter = cleanIter + 1
    end
    return(globalPopGrowths)
  end

end
