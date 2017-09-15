require_relative '../tick-tack-toe'
describe Game do

  let(:game) {Game.new(player: "X")}

  it "takes players letter choice" do
    expect(game.player).to eq("X")
  end

  it "returns true if the last play won" do
    game.turn(Move.new(0,0,"X"))
    expect(game.turn(Move.new(0,1,"X"))).to eq(false)
    expect(game.turn(Move.new(0,2,"X"))).to eq(true)
  end

end
