Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require 'pry'

class Play
  attr_accessor :game

  def initialize
    self.game = Game.new(player: player_select)
  end

  def player_select
    puts "Would you like to be X or O?"
    player = ""
    while player.empty?
      player = gets.chomp
      if player.upcase == "X" || player.upcase == "O"
        return player
      else
        puts "You can only be X or 0. Try again"
        player = ""
      end
    end

  end
end

# Play.new
