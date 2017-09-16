Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require 'pry'

def run!
  @play =  Play.new
  @game = @play.game
  while turn == nil do
    turn
  end
end

def turn
  begin
    system "clear"
    puts end_game?(@win) if @win
    return @win if end_game?(@win)
    puts @game.board.draw
    puts "What is your next move (e.g. A1)"
    if @play.human == @game.player
      @win = @play.place_turn(gets.chomp)
    else
      @win = @play.ai.takes_turn(@game)
    end
    @game.player = @game.next_player
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

run! if __FILE__==$0
