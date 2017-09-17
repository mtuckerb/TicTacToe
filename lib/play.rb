
class Play
  attr_accessor :game, :human, :ai

  def initialize(params = {})
    self.human = params[:human].upcase if params[:human]
    self.game = Game.new
    self.ai = AI.new(human_player: human)
  end


  def human_player
    return self.human.upcase if self.human
  end

  def place_turn( coord )
    game.player = human_player
    game.turn(coord)
  end

end #class
