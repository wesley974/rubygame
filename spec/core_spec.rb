require_relative '../lib/core' # here is class we are testing

describe Core do
  subject { Core.new }

  describe '#initialize' do
    it 'sets the secret number' do
      expect(@secret).to be > 0
      expect(@secret).to be < 100
    end
  end

  describe '#guess' do
    it 'increases secret of attempts' do
       subject.guess(5)
       expect(subject.tries).to eq 1
       subject.guess(8)
       expect(subject.tries).to eq 2
    end

    context 'result' do
      let(:number) { @secret }

      it 'returns result depending on guess' do
        expect(subject.guess(@secret - 1)).to eq :bigger
        expect(subject.guess(@secret + 1)).to eq :smaller
        expect(subject.guess(@secret)).to eq :guess
      end
    end
  end
end