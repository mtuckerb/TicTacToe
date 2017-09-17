require 'matrix'

class Game #state
  attr_accessor :board, :player

  def initialize(params = {})
    self.player = "X"
    self.board = Board.new()
  end

  def next_player
    ["X","O"].reject{|a| a == player}.first
  end

  def next_player!
    self.player = self.next_player
  end

  def turn(coord)
    board.place( coord, self.player )
    return self
  end

  def win?(p)
    cells = board.cells
    return "draw" if cells.flatten.compact.size > 8
    n = cells.size
    m = Matrix[*cells]
    pvec = Matrix.build(1,n){p}.row(0)
    if m.row_vectors.any?    { |r| r == pvec }      ||
      m.column_vectors.any? { |c| c == pvec }    ||
      Vector[*m.each(:diagonal).to_a] == pvec    ||
      n.times.all? { |i| cells[i][n-i-1] == p }
        return(p)
    end
  end
  # turn the coordinates into an [x,y] array



end
