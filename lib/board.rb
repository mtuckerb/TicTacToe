class Board
  attr_accessor :cells

  def initialize
    self.cells = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  end

  def place(coord, player)
    x,y = coord_array(coord)
    valid?(x,y)
    cells[x][y] = player
    return true
  end

  def valid?(x,y)
    raise InvalidPlayError, "That is not a valid placement" if x > 2 || y > 2
    raise InvalidPlayError, "#{[x,y]} is occupied" if cells[x][y] != nil
  end

  def draw
    string = "     A   B   C\n"
    cells.each_with_index do |x,idx|
      string += outline(idx+1)
      x.each_with_index do |y,i|
        string += fill_cell(y,i)
      end
      string += "|\n"
    end
    string += "   +---+---+---+\n"
    return string
  end

  def fill_cell(value)
    if value
      result = "| #{value} "
    else
      result = "|   "
    end
    return result
  end

  def outline(idx)
    return "   +---+---+---+\n#{idx}  "
  end

  def coord_array(coord)
    arr = coord.match(/([A,B,C,a,b,c])([1,2,3])/).to_a
    raise InvalidPlayError, "#{coord} invalid:  must be in the format [a-c][1-3]" unless arr[1] && arr[2]
    y = arr[1].downcase.ord - 97
    x = arr[2].to_i - 1
    return x,y

  end

end
