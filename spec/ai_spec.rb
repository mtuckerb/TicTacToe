require_relative '../tic-tac-toe'
describe AI do

  let(:play) { Play.new(human: "X") }
  let(:ai) {AI.new(human_player: "X")}

  it "becomes the opposite player" do
    expect(play.ai.ai_player).to eq "O"
  end

  it "takes a turn" do
    play.place_turn("A1") # speeds up test to take first turn
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

  it "shows a +8 score on 3 turn win?" do
    game = play.game
    ai.human_player = "O"
    game.turn("A1")
    game.turn("B1")
    game.turn("A2")
    game.turn("B2")
    game.turn("A3")
    expect(ai.score(game)).to eq 8
  end

  it "shows a -8 score on 3 turn loss" do
    game = play.game
    ai.human_player = "X"
    game.turn("A1")
    game.turn("B1")
    game.turn("A2")
    game.turn("B2")
    game.turn("A3")
    expect(ai.score(game)).to eq(-8)
  end

  it "minimax scores remaining moves" do
    game = play.game
    ai.human_player = "X"
    game.turn("A1")
    game.turn("B1")
    game.turn("A2")
    game.turn("B2")
    ai.minimax(game)
    expect(ai.choice ).to eq("A3")
  end

end
