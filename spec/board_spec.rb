require 'board'

describe Board do

  it "creates a 3x3 array" do
    board = Board.new
    expect(board.board.size).to eq(3)
  end

end
