
class Play
  attr_accessor :game, :player

  def initialize(params = {})
    self.player = params[:player]  if params[:player]
    player_select unless self.player
    self.game = Game.new(player: player)
  end


  def player_select
    puts "Would you like to be X or O?"
    player = ""
    while player.empty? do
      player = get_stdin
      if player.upcase == "X" || player.upcase == "O"
        break
      else
        puts "You can only be X or 0. Try again"
        player = ""
      end
    end
     self.player = player
  end

  def place_turn( coord )
    game.turn(coord)
  end

    # creating a method for this to make mocking easier
    def get_stdin
      return gets.chomp
    end

end #class
