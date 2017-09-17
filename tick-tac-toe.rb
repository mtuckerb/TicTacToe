Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require 'pry'

class TicTacToe

  def initialize
    @play =  Play.new
    @game = @play.game
    @win = nil
    set_human_player
    system "clear"
    until @win do
       turn
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
      puts "What is your next move (e.g. A1)"
      if @play.human == @game.player
        @win = @play.place_turn(gets.chomp)
      else
        @win = @play.ai.takes_turn(@game)
      end
       if @win
         system "clear"
         puts end_game?(@win)
       end
      @game.player = @game.next_player
      system "clear"
      return @win if end_game?(@win)
      return nil
    rescue InvalidPlayError => e
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
