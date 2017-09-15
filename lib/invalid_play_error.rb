class InvalidPlayError < StandardError
  def initialize(msg="This cell is occupied")
    super
  end
end
