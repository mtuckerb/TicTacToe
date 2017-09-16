require_relative '../tick-tack-toe'

describe AI do

  let(:play) { Play.new(human: "X") }

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
end
