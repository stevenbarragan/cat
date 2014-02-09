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
end
