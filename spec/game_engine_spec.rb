Rspec.describe GameEngine do
  describe "#initialize" do
    it "initialiaze a max number" # maxnum
    it "initialize secret number" # secret
    it "initialize tries number" # tries
    expect(maxnum).not_to be_empty
    expect(tries).to be_empty
  end

  describe "#a_number?" do
    it "test if it is an integer"
    expect(answer).to be_an(integer)
  end

  describe "#check" do
    context "test if you wish to quit the game" do
      expect(answer).to eq('quit')
    end

    it "test if your number is a integer" # a_number(answer)
    it "increase" # tries + 1

    context "too smaller" do
      expect(answer).to be < secret
    end

    context "too bigger" do
      expect(answer).to be > secret
    end

    context "a Magician" do
     expect(answer).to eq(secret)
     expect(tries).to eq(1)
    do

    context "a winner" do
      expect(answer).to eq(secret)
    end
  end

end
