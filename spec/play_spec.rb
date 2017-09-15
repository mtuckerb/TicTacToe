require_relative '../tick-tack-toe.rb'


describe Play do

  let(:game){Play.new(player: "X")}

  context "player chooses sides" do
    it "and selects X" do
      play = Play.new
      allow_any_instance_of(Play).to receive(:get_stdin).and_return("X")
      player = play.player_select
      expect(player).to eq("X")
    end

    it "and selects O" do
      play = Play.new
      allow_any_instance_of(Play).to receive(:get_stdin).and_return("O")
      player = play.player_select
      expect(player).to eq("O")
    end
  end #context

  it "returns a board when start is called" do
    expect(game.start).to respond_to(:board)
  end

end #describe
