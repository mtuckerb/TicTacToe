class Board
  attr_accessor :cells

  def initialize(params= {})
    self.cells = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  end

  def place(move)
      valid?(move)
      cells[move.x][move.y] = move.player
      return true
  end

  def valid?(move)
    raise InvalidPlayError if cells[move.x][move.y] != nil
  end

end
