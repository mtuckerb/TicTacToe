require_relative '../tic-tac-toe'
require 'pry'
describe AI do

  let(:play) { Play.new(human: "X") }
  let(:ai) {AI.new(human_player: "X")}

  it "becomes the opposite player" do
    expect(play.ai.ai_player).to eq "O"
  end

  it "takes a turn" do
    cells = play.game.board.cells.dup.map(&:dup)
    play.ai.takes_turn(play.game)
    expect(cells).not_to eq(play.game.board.cells)
  end

  it "shows available moves" do
    cells = play.game.board.cells
    cells[0][1] = "X"
    cells[0][2] = "O"
    expect(play.ai.available_moves(play.game.board)).to eq ["A1", "A2", "B2", "C2", "A3", "B3", "C3"]
  end

  it "shows a +7 score on single turn win?" do
    game = play.game
    ai.ai_player = "O"
    game.player = "O"
    game.turn("A1")
    game.turn("A2")
    game.turn("A3")
    expect(ai.score(game, 3)).to eq 7
  end

  it "shows a -7 score on single turn loss" do
    game = play.game
    ai.ai_player = "X"
    ai.human_player = "O"
    game.player = "O"
    game.turn("A1")
    game.turn("A2")
    game.turn("A3")
    expect(ai.score(game, 3)).to eq -7
  end

  it "minimax scores remaining moves" do
    game = play.game
    game.player = "O"
    game.turn("A1")
    game.player = "X"
    game.turn("A2")
    game.player = "O"
    game.turn("A3")
    game.player = "X"
    game.turn("B1")
    puts game.board.draw
    game.player = "O"
    game.turn("B2")
    choice = ai.minimax(game,3)
    expect(ai.choice ).to eq("C3")
  end
end
