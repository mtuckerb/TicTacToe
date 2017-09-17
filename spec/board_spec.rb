  require_relative '../tic-tac-toe'


describe Board do
  let(:board) {Board.new()}

  it "creates a 3x3 array" do
    expect(board.cells.size).to eq(3)
  end


  it "allows a player to select a cell" do
    board.place("A3","X")
    expect(board.cells[2][0]).to eq("X")
    expect(board.cells[1][0]).to be(nil) # and only that cell
  end

  it "doesn't allow player to select an occupied cell" do
    board.place("A2", "X")
    expect {board.place("A2","X")}.to raise_error(InvalidPlayError)
  end

  it "should display the board" do
    board_like = <<-EOS
     A   B   C
   +---+---+---+
1  |   |   |   |
   +---+---+---+
2  |   |   |   |
   +---+---+---+
3  |   |   |   |
   +---+---+---+
    EOS
    board = Board.new
    expect(board.draw).to eq(board_like)
  end

    it "turns A1 into 0,0" do
      expect(board.coord_array("A1")).to eq([0,0])
    end

  it "should raise error if coordinates are out of range" do
    expect{board.place("X1","X")}.to raise_error(InvalidPlayError)
  end

  it "should raise error if coordinates are not alpha numeral" do
    expect{board.place("11","X")}.to raise_error(InvalidPlayError)
  end
end
