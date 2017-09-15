  require_relative '../tick-tack-toe'


describe Board do
  let(:board) {Board.new()}

  it "creates a 3x3 array" do
    expect(board.cells.size).to eq(3)
  end


  it "allows a player to select a cell" do
    board.place(Move.new(1,3,"X"))
    expect(board.cells[1][3]).to eq("X")
    expect(board.cells[0][3]).to be(nil) # and only that cell
  end

  it "doesn't allow player to select an occupied cell" do
    board.place(Move.new(1,3,"X"))
    expect {board.place(Move.new(1,3,"X"))}.to raise_error(InvalidPlayError)
  end


end
