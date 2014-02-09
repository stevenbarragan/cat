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
  end
end
