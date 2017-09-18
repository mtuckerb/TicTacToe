require 'pry'
class AI
  attr_accessor :human_player, :ai_player, :game_clone, :choice

  def initialize(params = {})
    self.ai_player = ["X","O"].reject{|a| a == params[:human_player] }.first
  end

  def human_player=(player)
    self.ai_player = ["X","O"].reject{|a| a == player }.first
    @human_player = player
    return player
  end

  def clone_game(game)
    self.game_clone = Marshal.load(Marshal.dump(game) )
    return self.game_clone
  end

  def takes_turn(game)
    self.choice = nil
    clone_game(game)
    minimax(game_clone)
    game.turn(self.choice)
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
    if game.win? == self.ai_player
        return 10 - depth
    elsif game.win? == self.human_player
        return depth - 10
    else
        return 0
    end
  end

  def minimax(game)
    if game.turn_no == 0 && self.ai_player == "X"
      # First turn is set manually to speed up the AI
      self.choice = "C3"
      return 10
    end
    return score(game, game.turn_no) if game.over?
    moves = []
    scores = []
    available_moves(game.board).each do | move |
      clone_game(game).turn(move)
      scores.push(minimax(game_clone))
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
