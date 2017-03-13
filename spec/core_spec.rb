require_relative '../lib/core'

describe Core do
  before do
    @player = Core.new(60)
  end
  it 'initializes the secret number to 60' do
    expect(@player.secret).to be == 60
  end
  it 'tries the number 50, get :higher' do
    expect(@player.guess(50)).to be == :higher
  end
  it 'tries the number 80, get :lower' do
    expect(@player.guess(80)).to be == :lower
  end
  it 'tries the number 60, get :win' do
    expect(@player.guess(60)).to be == :win
  end
  it 'attempts = 3' do
    @player.guess(50)
    @player.guess(80)
    @player.guess(60)
    expect(@player.tries).to be == 3
  end
end
