class Neighbour
  def initialize(seating_arrangement)
    @seating_arrangement = seating_arrangement
  end
  
  def find(x, y)
    neighbours = []
    
    neighbours << north_west_neighbour(x, y)
    neighbours << north_neighbour(x, y)
    neighbours << north_east_neighbour(x, y)
    neighbours << west_neighbour(x, y)
    neighbours << east_neighbour(x, y)
    neighbours << south_west_neighbour(x, y)
    neighbours << south_neighbour(x, y)
    neighbours << south_east_neighbour(x, y)
    
    neighbours.compact
  end
  
  def north_west_neighbour(x, y)
    if(x > 0 && y > 0)
      @seating_arrangement[x-1][y-1]
    end
  end
  
  def north_neighbour(x, y)
    if(x > 0)
      @seating_arrangement[x-1][y]
    end
  end
  
  def north_east_neighbour(x, y)
    if(x > 0 && y < @seating_arrangement[0].length - 1)
      @seating_arrangement[x-1][y+1]
    end
  end
  
  def west_neighbour(x, y)
    if(y > 0)
      @seating_arrangement[x][y-1]
    end
  end
  
  def east_neighbour(x, y)
    if(y < @seating_arrangement[0].length - 1)
      @seating_arrangement[x][y+1]
    end
  end
  
  def south_east_neighbour(x, y)
    if(x < @seating_arrangement.length - 1 && y < @seating_arrangement[0].length - 1)
      @seating_arrangement[x+1][y+1]
    end
  end
  
  def south_neighbour(x, y)
    if(x < @seating_arrangement.length - 1)
      @seating_arrangement[x+1][y]
    end
  end
  
  def south_west_neighbour(x, y)
    if(x < @seating_arrangement.length - 1 && y > 0)
      @seating_arrangement[x+1][y-1]
    end
  end
  
end