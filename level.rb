#writen by Taylor Birchem (10/19/2021)
require 'ruby2d'
require_relative 'grid'

class Level < Window
  attr_accessor :grid, :line

  def draw_grid(level=nil)
    @level = level || 0
    set( { title: 'EcoSystem', background: 'white', height: 640, width: 640 } )
    @line = []
    @tiles = @grid.tiles
  end

  def beside(tile)
    return true if right_of(tile) || left_of(tile) || up_of(tile) || down_of(tile)
    false
  end

  def up_of(tile)
    return false if @line.last.nil?
    @tiles.index(@line.last) - @grid.grid_size == @tiles.index(tile)
  end

  def down_of(tile)
    return false if @line.last.nil?
    @tiles.index(@line.last) + @grid.grid_size == @tiles.index(tile)
  end

  def left_of(tile)
    return false if @line.last.nil?
    @tiles.index(@line.last) - 1 == @tiles.index(tile)
  end

  def right_of(tile)
    return false if @line.last.nil?
    @tiles.index(@line.last) + 1 == @tiles.index(tile)
  end
end

Level.new().show
