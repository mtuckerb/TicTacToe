Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require 'pry'

def run!
  play =  Play.new
  game = play.game
  loop do
    begin
      puts game.board.draw
      puts "What is your next move (e.g. A1)"
      win = play.place_turn(gets.chomp)
      if win
        puts game.board.draw
        puts "\n\nYOU WIN!!!\n\n"
        break
      end
    rescue InvalidPlayError => e
      puts e
    end
  end
end


run! if __FILE__==$0
