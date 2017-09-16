class AI

  attr_accessor :human_player, :ai_player

  def initialize(params = {})
    self.ai_player = ["X","O"].reject{|a| a == params[:human_player] }.first
  end

  def takes_turn(game)
    # game.player = ai_player
    next_ai_turn = available_moves(game.board).sample
    puts "Computer Takes #{next_ai_turn}"
    game.turn(next_ai_turn)
  end

  def available_moves(board)
    moves = []
    board.cells.each_with_index do |cell,row|
      cell.each_with_index do |r,col|
        if r == nil
          moves.push("#{alphabetize(col)}#{row+1}")
        end
      end
    end
    return moves
  end

  def alphabetize(num)
    letter = {0 => "A", 1 => "B", 2 => "C"}
    return letter[num]
  end
end
