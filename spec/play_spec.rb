require_relative '../tick-tack-toe.rb'


describe Play do
  context "player chooses sides" do
    it "and selects X" do
      allow_any_instance_of(Play).to receive(:get_stdin).and_return("X")
      play = Play.new(player: "O")
      player = play.player_select
      expect(player).to eq("X")
    end

  end #context

    it "updates the board with the turn" do
      allow_any_instance_of(Play).to receive(:get_stdin).and_return("X")
      play = Play.new(player: "O")
      play.place_turn("A1")
      expect(play.game.board.cells[0][0]).to eq("O")
    end

end #describe
