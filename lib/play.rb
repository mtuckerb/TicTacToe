class Play
  attr_accessor :game,  :ai, :human

  def initialize(params = {})
    self.game = Game.new
    self.ai = AI.new()
    self.human = params[:human].upcase if params[:human]
  end

  def human=(player)
    @human = player.upcase
    self.ai.human_player = player.upcase
    return player
  end

  def human_player
    return self.human.upcase if self.human
  end

  def place_turn( coord )
    game.player = human_player
    game.turn(coord)
  end
  
end #class
