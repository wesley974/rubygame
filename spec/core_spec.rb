require_relative '../lib/core' # here is class we are testing

describe Core do
  subject { Core.new }

  describe '#cheat' do
    it 'show the number' do
      expect(subject.cheat).to be > 0
      expect(subject.cheat).to be < 100
    end
  end

  describe '#guess' do
    it 'increases number of tries' do
       subject.guess(5)
       expect(subject.tries).to eq 1
       subject.guess(8)
       expect(subject.tries).to eq 2
    end

    context 'result' do
      let(:cheat) { subject.cheat }

      it 'returns result depending on guess' do
        expect(subject.guess(cheat - 1)).to eq :bigger
        expect(subject.guess(cheat + 1)).to eq :smaller
        expect(subject.guess(cheat)).to eq :guess
      end
    end
  end
end
