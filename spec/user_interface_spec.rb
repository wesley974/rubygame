Rspec.describe UserInterface do

  describe "#initialize" do
    it "show the title"
    it "show the teaser"
    it "show the rules"
  end

  describe "#your_name" do
    it "set default name to 'Guess'" # missing_name
    it "ask for your name" # name
    it "test if you wish to quit the game" # == 'quit'
  end

  describe "#ask" do
    it "ask for a number" # answer
  end

  describe "#bybye" do
    it "exit the game"
  end
end
