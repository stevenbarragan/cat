require 'spec_helper'

describe Move do
  context '#next' do
    let(:subject){ described_class.new( moves )}

    context 'first move' do
      let(:moves){ [] }

      it 'returns one corner' do
        expect(subject.next).to be_in [1,3,7,9]
      end
    end

    context 'second move' do
      let(:moves){ [1] }

      it 'choose center' do
        expect(subject.next).to eq 5
      end
    end

    context 'second move' do
      let(:moves){ [1,5,9,7] }

      it 'returns one corner' do
        expect(subject.next).to eq 3
      end
    end

    context 'block fork' do
      let(:moves){ [9,5,1] }

      it 'returns one corner' do
        expect(subject.next).to be_in [2,4,6,8]
      end
    end

    context 'block fork' do
      let(:moves){ [1,5,9] }

      it 'returns one corner' do
        expect(subject.next).to be_in [2,4,6,8]
      end
    end
  end

  context '#status' do
    let(:subject){ described_class.new(moves) }

    context 'player 1 wins' do
      let(:moves){ [1,2,5,3,9]}

      it 'returns 1' do
        expect(subject.status).to eq 1
      end
    end

    context 'player 2 wins' do
      let(:moves){ [1,2,3,5,7,8]}

      it 'returns 1' do
        expect(subject.status).to eq 2
      end
    end

    context 'any player win' do
      let(:moves){ [1,5,9,2,8,6,4,7,3]}

      it 'returns 1' do
        expect(subject.status).to eq 0
      end
    end
  end

  context '#win_path' do
    let(:subject){ described_class.new( moves )}

    context 'diagonal' do
      let(:moves){ [1,2,3,4,5,6,7,8,9] }

      it 'returns the diagonal' do
        expect(subject.win_path).to eq [1,5,9]
      end
    end

    context 'row' do
      let(:moves){ [1,4,2,5,9,6] }

      it 'returns the row' do
        expect(subject.win_path).to eq [4,5,6]
      end
    end

    context 'column' do
      let(:moves){ [1,2,4,5,7] }

      it 'returns the colum' do
        expect(subject.win_path).to eq [1,4,7]
      end
    end
  end
end
