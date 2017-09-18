require_relative '../tic-tac-toe'
describe Game do

  let(:game) {Game.new}

  it "takes players letter choice" do
    expect(game.player).to eq("X")
  end

  it "returns true if the last play won" do
    game.turn("A1")
    game.turn("B1")
    game.turn("A2")
    game.turn("B2")
    expect(game.win?).to eq(nil)
    game.turn("A3")
    expect(game.win?).not_to eq(nil)
  end

  it "returns draw if game is a stalemate" do
    game.player = "X"
    game.turn("A1")
    game.player = "O"
    game.turn("A2")
    game.player = "O"
    game.turn("A3")
    game.player = "O"
    game.turn("B1")
    game.player = "X"
    game.turn("B2")
    game.player = "X"
    game.turn("B3")
    game.turn("C1")
    game.turn("C2")
    game.player = "O"
    game.turn("C3")
    expect(game.win?).to eq "draw"
  end

    it "returns the next player's letter" do
      game.player = "X"
      expect(game.next_player).to eq("O")
    end

    it "sets Game#player to the next player" do
      game.player = "X"
      game.next_player!
      expect(game.player).to eq("O")
    end
end
