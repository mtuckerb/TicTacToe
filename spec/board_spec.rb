require 'board'

describe Board do
  let(:board) {Board.new(player: "X")}

  it "creates a 3x3 array" do
    expect(board.board.size).to eq(3)
  end

  it "takes players letter choice" do
    expect(board.player).to eq("X")
  end

  it "allows a player to select a cell" do
    board.play(1,3)
    expect(board.board[1][3]).to eq("X")
  end

  it "doesn't allow player to select an occupied cell" do
    board.play(1,3)
    expect {board.play(1,3)}.to raise_error(InvalidPlayError)
  end
end
