Rspec.describe GameEngine do
  describe "#initialize" do
    it "initialize secret number" # secret
    it "initialize tries number" # tries
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

  describe "#a_number?" do
    it "test if it is an integer"
  end

  describe "#check" do
    it "test if you wish to quit the game" # == 'quit'
    it "test if your number is a integer" # a_number(answer)
    it "increase" # tries + 1
    it "test if your number is <" # too smaller
    it "test if your number is >" # too bigger
    it "test if your number is == && if your tries is 1" # the magian winner
    it "test if your number is ==" # the winner
  end

end
