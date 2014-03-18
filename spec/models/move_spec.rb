require 'spec_helper'

describe Move do
  describe '#next' do
    context '3x3 board' do
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

        it 'returns corner to make a fork' do
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

      context 'block win' do
        let(:moves){ [1,5,9,2] }

        it 'returns one corner' do
          expect(subject.next).to eq 8
        end
      end
    end

#     context 'in a 4x4 board' do
#       context 'it blocks if opposite is about to win' do
#         let(:subject){ described_class.new moves, 4 }
#
#         let(:moves){ [1,2,6,3,11] }
#
#         it 'blocks wining' do
#           expect(subject.next).to eq 16
#         end
#       end
#     end
  end

  context '#status' do
    context '3x3 board' do
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

      context 'no player wins' do
        let(:moves){ [1,5,9,2,8,6,4,7,3]}

        it 'returns 1' do
          expect(subject.status).to eq 0
        end
      end
    end

    context '4x4 board' do
      let(:subject){ described_class.new(moves, 4) }

      context 'player 1 wins' do
        let(:moves){ [1,2,6,3,11,4,16]}

        it 'returns 1' do
          expect(subject.status).to eq 1
        end
      end

      context 'player 2 wins' do
        let(:moves){ [2,1,3,6,4,11,9,16]}

        it 'returns 2' do
          expect(subject.status).to eq 2
        end
      end

      context 'no player wins' do
        let(:moves){ [1,2,4,3,7,5,8,6,9,12,10,13,11,14,15,16]}

        it 'returns 0' do
          expect(subject.status).to eq 0
        end
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

    context 'without a winning path' do
      let(:moves){ [1,5,9,2,8,6,4,7,3]}

      it 'returns the colum' do
        expect(subject.win_path).not_to be_true
      end
    end
  end
end
