require_relative '../tick-tack-toe'
describe Game do

  let(:game) {Game.new(player: "X")}

  it "takes players letter choice" do
    expect(game.player).to eq("X")
  end

  it "returns true if the last play won" do
    game.turn("A1")
    expect(game.turn("A2")).to eq(nil)
    expect(game.turn("A3")).to eq("X")
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
    expect(game.turn("C3")).to eq "draw"
  end

    it "returns the next player's letter" do
      game.player = "X"
      expect(game.next_player).to eq("O")
    end
end
