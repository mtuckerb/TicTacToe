require 'pry'
class AI
  attr_accessor :human_player, :ai_player,:turn, :game_clone, :choice

  def initialize(params = {})
    self.ai_player = ["X","O"].reject{|a| a == params[:human_player] }.first
    self.turn = 0

  end

  def clone_game(game)
    self.game_clone = Marshal.load(Marshal.dump(game) )
  end

  def takes_turn(game)
    # next_ai_turn = available_moves(game.board).sample
    clone_game(game)
    minimax(game_clone, self.turn)
    game.turn(self.choice)
    self.turn += 1
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

  def score(game, depth)
    if game.win?(self.ai_player)
        return 10 - depth
    elsif game.win?(self.human_player )
        return depth - 10
    else
        return 0
    end
  end

  #something weird is happening here. it's returning an array but if you t
  def minimax(game, depth)
    if self.turn == 0 && self.ai_player == "X"
      self.choice = "C3"
      return 9
    end
    return score(game, depth) if game.win?("X") || game.win?("O")
    depth += 1
    moves = []
    scores = []
    available_moves(game.board).each do | move |
      meta_game = clone_game(game)
      meta_game.turn(move)
      meta_game.next_player!
      scores.push(minimax(meta_game, depth))
      moves.push(move)
    end
    if game.player == self.ai_player
       max_score_index = scores.each_with_index.max[1]
       self.choice = moves[max_score_index]
       return scores[max_score_index]
     else
       min_score_index = scores.each_with_index.min[1]
       self.choice = moves[min_score_index]
       return scores[min_score_index]
    end
  end
end
