#writen by Taylor Birchem (10/19/2021)
#last modified by Joshua Cross (11/6/2021)
#last modified by Taylor Birchem (11/15/2021)

require 'ruby2d'

class Grid < Square
  attr_accessor :tiles
  attr_reader :grid_size, :x, :y, :tile_size, :margin

  def initialize(params)
    @tiles = []
    @dots = params[:dots]
    @grid_size = params[:grid_size] ||= 8
    @x = params[:x] ||= 60
    @y = params[:y] ||= 60
    @tile_size = params[:tile_size] ||= 100
    @margin = params[:margin] ||= 2
    draw_grid
  end

  def draw_grid
    y = @y
    @grid_size.times do
      x = @x
      @grid_size.times do
        @tiles << Tile.new(
          x: x,
  	      y: y,
          size: @tile_size,
          color: 'white'
        )
        x += @tile_size + @margin
      end
      y += @tile_size + @margin
    end

  def tile_center_position(tile)
    x = tile.x + (tile.size / 2)
    y = tile.y + (tile.size / 2)
    [x, y]
  end

  end
end
