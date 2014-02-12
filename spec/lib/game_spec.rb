require 'spec_helper'

class Dummy
  include Game
end

describe Game do
  let(:subject){ Dummy.new }

  context '#win_path?' do
    context 'a row' do
      let(:path){ [1,2,3,5]}

      it 'returns true' do
        expect(subject.win_path?(path)).to be_true
      end
    end

    context 'a colums' do
      let(:path){ [2,5,8,1] }

      it 'returns true' do
        expect(subject.win_path?(path)).to be_true
      end
    end

    context 'a diagonal' do
      let(:path){ [1,5,9,4]}

      it 'returns true' do
        expect(subject.win_path?(path)).to be_true
      end
    end
  end

  context '#win_paths?' do
    context 'a row' do
      let(:path){ [1,4,2,8,3,6]}

      it 'returns true' do
        expect(subject.win_paths?(path)).to be_true
      end
    end

    context 'a colums' do
      let(:path){ [1,2,4,5,6,8]}

      it 'returns true' do
        expect(subject.win_path?(path)).to be_true
      end
    end

    context 'a diagonal' do
      let(:path){ [1,4,5,2,9]}

      it 'returns true' do
        expect(subject.win_path?(path)).to be_true
      end
    end

    context 'real example' do
      let(:path){ [9,5,1,7,3,2,6] }

      it 'returns true' do
        expect(subject.win_path?(path)).to be_true
      end
    end

    context 'real example' do
      let(:path){ [1,6,2,7,3] }

      it 'returns true' do
        expect(subject.win_path?(path)).to be_true
      end
    end
  end

  context '#split_movements' do
    let(:path){ [1,2,3,4,5,6,7,8,9] }

    it 'returns each players movements' do
      moves1, moves2 = subject.split_movements(path)
      expect(moves1).to eq [1,3,5,7,9]
      expect(moves2).to eq [2,4,6,8]
    end
  end
end
