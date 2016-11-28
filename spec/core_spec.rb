require_relative '../lib/core' # here is class we are testing

describe Core do
  subject { Core.new }

  describe '#initialize' do
    it 'sets the secret number' do
      expect(subject.secret).to be > 0
      expect(subject.secret).to be < 100
    end
  end

  describe '#guess' do
    it 'increases number of attempts' do
       subject.guess(5)
       expect(subject.attempts).to eq 1
       subject.guess(8)
       expect(subject.attempts).to eq 2
    end

    context 'result' do
      let(:number) { subject.number }

      it 'returns result depending on guess' do
        expect(subject.guess(number - 1)).to eq :bigger
        expect(subject.guess(number + 1)).to eq :smaller
        expect(subject.guess(number)).to eq :guess
      end
    end
  end
end
