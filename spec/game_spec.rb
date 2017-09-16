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


end
