Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }


class TicTacToe

  def initialize
    @play =  Play.new
    @game = @play.game
    @win = nil
    set_human_player
    system "clear"
    until @win do
      turn
      puts "Current: #{@game.player} Turn: #{@game.turn_no}"
    end
  end

  def set_human_player
    puts "Would you like to be X or O?"
    human = ""
    while human.empty? do
      human = gets.chomp.upcase
      if human == "X" || human == "O"
        break
      else
        puts "You can only be X or O. Try again"
        human = ""
      end
    end
    @play.human = human
  end

  def turn
    begin
      puts @game.board.draw
      case @game.player
      when @play.human
        puts "What is your next move (e.g. A1)"
        @play.place_turn(gets.chomp)
      else
        puts "Computer is thinking. Please wait…"
        @play.ai.takes_turn(@game)
      end
      @win = @game.win?
       if @win
         system "clear"
         puts end_game?(@win)
       end
      system "clear"
      return @win if end_game?(@win)
      return nil
    rescue InvalidPlayError => e
      system "clear"
      puts e
    end
    return nil
  end


  def end_game?(win)
    if win == @play.human_player
      puts @game.board.draw
      puts "\n\nYOU WIN!!!\n\n"
    elsif win == @play.ai.ai_player
      puts @game.board.draw
      puts "\n\nYOU LOSE!!!\n\n?"
    elsif win == "draw"
      puts @game.board.draw
      puts "\n\nThis game is a TIE!\n\n"
    else
      return nil
    end
  end
end
TicTacToe.new if __FILE__==$0
