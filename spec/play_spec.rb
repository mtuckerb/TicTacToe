require_relative '../tic-tac-toe.rb'


describe Play do
  context "human chooses sides" do
    it "and selects X" do
      # allow_any_instance_of(Play).to receive(:get_stdin).and_return("X")
      play = Play.new(human: "X")
      expect(play.human_player).to eq("X")
    end

    it "sets ai to O  " do
      # allow_any_instance_of(Play).to receive(:get_stdin).and_return("X")
      play = Play.new(human: "X")
      expect(play.ai.ai_player).to eq("O")
    end

  end #context

    it "updates the board with the turn" do
      # allow_any_instance_of(Play).to receive(:get_stdin).and_return("X")
      play = Play.new(human: "O")
      play.place_turn("A1")
      expect(play.game.board.cells[0][0]).to eq("O")
    end

end #describe
