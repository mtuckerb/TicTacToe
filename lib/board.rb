class Board
  attr_accessor :board, :player

  def initialize(params= {})
    self.player = params[:player]
    self.board = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  end

  def play(x,y)
      raise InvalidPlayError if board[x][y] != nil
      board[x][y] = player

  end

end


class InvalidPlayError < StandardError

  def initialize(msg="This cell is occupied")
    super
  end

end
