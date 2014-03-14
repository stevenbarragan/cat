require 'spec_helper'

class Dummy
  include Game

  attr_accessor :size

  def initialize
    @size = 3
  end
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

  context '#calculate_win_paths' do
    context 'with a 3x3 board' do
      before do
        subject.size = 3
      end

      it 'returns 3x3 win paths' do
        paths = [
          [1,2,3],
          [4,5,6],
          [7,8,9],
          [1,4,7],
          [2,5,8],
          [3,6,9],
          [1,5,9],
          [3,5,7]
        ]

        expect(subject.calculate_win_paths).to eq paths
      end
    end

    context 'with a 2x2 board' do
      before do
        subject.size =  2
      end

      it 'returns 2x2 win paths' do
        paths = [
          [1,2],
          [3,4],
          [1,3],
          [2,4],
          [1,4],
          [2,3]
        ]

        expect(subject.calculate_win_paths).to eq paths
      end
    end
  end
end
