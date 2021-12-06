#writen by Joshua Cross (11/26/2021)
#last modified by Joshua Cross (12/5/2021)
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
          if(@grid[rowIter][columnIter].getSpecies[focusID].getLocalPopulation > 1)
            @grid[rowIter][columnIter].getSpecies[focusID].setLocalPopulation((lastPop * ((2.71828) ** 0.1)).to_i + 1)
          else
            @grid[rowIter][columnIter].getSpecies[focusID].setLocalPopulation((lastPop * ((2.71828) ** 0.1)).to_i)
          end
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

  def dieByThirst(waterQuantity)
    #puts("water: #{waterQuantity}")
    rng = Random.new
    numSpecies = @grid[0][0].getSpecies.length
    rowIter = 0
    globalDeaths = Array.new(@grid[0][0].getSpecies.length)
    deathIniter = 0
    while (deathIniter < globalDeaths.length)
      globalDeaths[deathIniter] = 0
      deathIniter = deathIniter + 1
    end
    while (rowIter < @grid.length)
      columnIter = 0
      while (columnIter < @grid[rowIter].length)
        #puts("new tile")
        focusID = 0
        waterDesired = Array.new(numSpecies)
        while (focusID < numSpecies)
          waterDesired[focusID] = (@grid[rowIter][columnIter].getSpecies[focusID].getLocalPopulation) * Population.getAnimalThirst
          #determine how much water is desired by each species on a tile in the given month
          #used to be .getPrevPop
          focusID = focusID + 1
        end

        totalWaterDesired = waterDesired.sum

        if(totalWaterDesired > waterQuantity)
          #puts("\nThings are dying!")
          #puts(@grid[rowIter][columnIter].getSpecies)
          #if quantity does not satisfy all water desired
          waterDifference = totalWaterDesired - waterQuantity
          #find how much water is still desired
          totalDeadAnimals = waterDifference / Population.getAnimalThirst
          deadAnimals = Array.new(numSpecies)
          i = 0
          while i < deadAnimals.length
            deadAnimals[i] = 0
            i = i + 1
          end
          #speciesExcess =Array.new(@grid[rowIter][columnIter].getSpecies.length)
          deathTarget = totalDeadAnimals
          j = 0
          totalPop = 0
          while j < @grid[0][0].getSpecies.length
            totalPop = totalPop + @grid[rowIter][columnIter].getSpecies[j].getLocalPopulation
            j = j + 1
          end
          while (totalDeadAnimals > 0) && (totalPop > 0)
            #find how many animals die of thirst
            #new version starts here
            russianRouletteID = rng.rand(totalPop) + 1
            victim = -1
            while russianRouletteID > 0
              victim += 1
              russianRouletteID = russianRouletteID - @grid[rowIter][columnIter].getSpecies[victim].getLocalPopulation
            end

            if (@grid[rowIter][columnIter].getSpecies[victim].getLocalPopulation - deadAnimals[victim] > 0)
              deadAnimals[victim] += 1
              totalDeadAnimals -= 1
              totalPop -= 1
            end
          end
          while focusID > 0
            globalDeaths[focusID - 1] = globalDeaths[focusID - 1] + deadAnimals[focusID - 1]
            #reflect changes in the grid
            #puts("deaths should be #{deathTarget}")
            #puts("deaths is #{deadAnimals}")
            @grid[rowIter][columnIter].getSpecies[focusID - 1].setLocalPopulation(@grid[rowIter][columnIter].getSpecies[focusID - 1].getLocalPopulation - deadAnimals[focusID - 1])
            focusID -= 1
          end
=begin
          #find proportions of the extra water each species took
          remainingDeaths = totalDeadAnimals
          focusIDReset = focusID
          outOfItsMiseryCounter = 2
          while (remainingDeaths > 0)
            focusID = focusIDReset
            while (focusID > 0)
              deadAnimals[focusID - 1] = ((totalDeadAnimals * (@grid[rowIter][columnIter].getSpecies[focusID - 1].getLocalPopulation/(totalPop) + 1))).to_i
              if(deadAnimals[focusID - 1] > @grid[rowIter][columnIter].getSpecies[focusID - 1].getLocalPopulation)
                #puts(deadAnimals[focusID - 1])
                deadAnimals[focusID - 1] = (@grid[rowIter][columnIter].getSpecies[focusID - 1].getLocalPopulation)/2
                if(outOfItsMiseryCounter <= 0)
                  deadAnimals[focusID - 1] += 1
                end
              end
              
              remainingDeaths = remainingDeaths - deadAnimals[focusID - 1]
              

              if(remainingDeaths <= 0)
                globalDeaths[focusID - 1] = globalDeaths[focusID - 1] + deadAnimals[focusID - 1]
                #reflect changes in the grid
                puts("deaths should be #{totalDeadAnimals}")
                puts("deaths is #{deadAnimals}")
                @grid[rowIter][columnIter].getSpecies[focusID - 1].setLocalPopulation(@grid[rowIter][columnIter].getSpecies[focusID - 1].getLocalPopulation - deadAnimals[focusID - 1])       
              end
              focusID = focusID - 1
            end
            outOfItsMiseryCounter = outOfItsMiseryCounter - 1
          end
=end
          #puts(deadAnimals)
          #puts(@grid[rowIter][columnIter].getSpecies)
        end
        columnIter = columnIter + 1
      end
      rowIter = rowIter + 1
    end
    #puts globalDeaths
    return(globalDeaths)
  end

  def predation
    rng = Random.new
    numSpecies = @grid[0][0].getSpecies.length
    appetite = 2
    
    globalDeaths = Array.new(@grid[0][0].getSpecies.length)
    deathIniter = 0
    while (deathIniter < globalDeaths.length)
      globalDeaths[deathIniter] = 0
      deathIniter = deathIniter + 1
    end
    rowIter = 0
    while (rowIter < @grid.length)
      columnIter = 0
      while (columnIter < @grid[rowIter].length)
        #START WORK ON TILE
        prey = 0
        while (prey < numSpecies - 1)
          if (@grid[rowIter][columnIter].getSpecies[prey].getLocalPopulation >= @grid[rowIter][columnIter].getSpecies[prey + 1].getLocalPopulation * appetite && @grid[rowIter][columnIter].getSpecies[prey].getLocalPopulation > 0)
            #if the bunnies can feed all the wolves
            globalDeaths[prey] += @grid[rowIter][columnIter].getSpecies[prey + 1].getLocalPopulation * appetite

            globalDeaths[prey + 1] += 0


            @grid[rowIter][columnIter].getSpecies[prey].setLocalPopulation((@grid[rowIter][columnIter].getSpecies[prey].getLocalPopulation) - (@grid[rowIter][columnIter].getSpecies[prey + 1].getLocalPopulation) * appetite)


          else
            #if the bunnies can't feed all the wolves
            localDeaths0 = @grid[rowIter][columnIter].getSpecies[prey].getLocalPopulation - @grid[rowIter][columnIter].getSpecies[prey].getLocalPopulation % appetite

            globalDeaths[prey] += localDeaths0

            localDeaths1 = (@grid[rowIter][columnIter].getSpecies[prey + 1].getLocalPopulation - @grid[rowIter][columnIter].getSpecies[prey].getLocalPopulation / appetite)

            globalDeaths[prey + 1] += localDeaths1


            @grid[rowIter][columnIter].getSpecies[prey].setLocalPopulation((@grid[rowIter][columnIter].getSpecies[prey].getLocalPopulation) - localDeaths0)

            @grid[rowIter][columnIter].getSpecies[prey + 1].setLocalPopulation((@grid[rowIter][columnIter].getSpecies[prey + 1].getLocalPopulation) - localDeaths1)
          end
          prey += 1
        end



        #STOP WORK ON TILE
        columnIter += 1
      end
      rowIter += 1
    end
    return globalDeaths
  end
end