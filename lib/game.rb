require 'matrix'

class Game #state
  attr_accessor :board, :player, :turn_no

  def initialize
    self.player = "X"
    self.turn_no = 0
    self.board = Board.new()
  end

  def next_player
    ["X","O"].reject{|a| a == player}.first
  end

  def last_player
    self.next_player
  end

  def next_player!
    self.player = self.next_player
    self.turn_no += 1 if self.player == "X"
  end

  def turn(coord)
    self.board.place( coord, self.player )
    next_player!
    return self
  end

  def over?
    self.win?
  end

  def win?
    ["X","O"].each do |p|
      cells = board.cells
      n = cells.size
      m = Matrix[*cells]
      pvec = Matrix.build(1,n){p}.row(0)
      if m.row_vectors.any?    { |r| r == pvec }      ||
        m.column_vectors.any? { |c| c == pvec }    ||
        Vector[*m.each(:diagonal).to_a] == pvec    ||
        n.times.all? { |i| cells[i][n-i-1] == p }
          return(p)
      end
      return "draw" if cells.flatten.compact.size > 8
    end
    return nil
  end
  # turn the coordinates into an [x,y] array



end
