require_relative '../lib/game_engine.rb'

RSpec.describe GameEngine do
  describe "#initialize" do
    it "initialize a max number" # maxnum
    it "initialize secret number" # secret
    it "initialize tries number" # tries
    it "initialize time" # start_time
  end

  describe "#a_number?" do
    it "test if your number is an integer" do
      expect(answer).to be_an(integer)
    end
  end

  describe "#check" do
    context "quit the game" do
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

    context "a winner" do
      expect(answer).to eq(secret)
    end
  end

end
