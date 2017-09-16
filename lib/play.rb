
class Play
  attr_accessor :game, :human, :ai

  def initialize(params = {})
    self.human = params[:human].upcase if params[:human]
    self.game = Game.new(player: human_player)
    self.ai = AI.new(human_player: human)
  end


  def human_player
    return self.human if self.human
    puts "Would you like to be X or O?"
    human = ""
    while human.empty? do
      human = get_stdin
      if human.upcase == "X" || human.upcase == "O"
        break
      else
        puts "You can only be X or 0. Try again"
        human = ""
      end
    end
     self.human = human.upcase
  end

  def place_turn( coord )
    game.player = human_player
    game.turn(coord)
  end

    # creating a method for this to make mocking easier
    def get_stdin
      return gets.chomp
    end

end #class
