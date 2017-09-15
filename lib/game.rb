require 'matrix'

class Game
  attr_accessor :board, :player

  def initialize(params = {})
    self.player = params[:player]
    self.board = Board.new()
  end

  def turn(move)
    board.place(move)
    return win?(player)
  end

  def win?(p)
    cells = board.cells
    n = cells.size
    m = Matrix[*cells]
    pvec = Matrix.build(1,n){p}.row(0)
    m.row_vectors.any?    { |r| r == pvec }      ||
      m.column_vectors.any? { |c| c == pvec }    ||
      Vector[*m.each(:diagonal).to_a] == pvec    ||
      n.times.all? { |i| cells[i][n-i-1] == p }
  end

end
