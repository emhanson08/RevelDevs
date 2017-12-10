require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '.new' do
    let(:game) { FactoryBot.create :game }
 
    it 'is valid' do
      expect(game).to be_valid
    end
  end

  describe 'board' do
    let(:game) { FactoryBot.create :game }
    let(:piece) { FactoryBot.create :piece }

    it '#square_occupied? returns true if coordinate is occupied' do
      result = game.square_occupied?(1, 1)
      expect(result).to eq true
    end
    it '#square_occupied? returns false if coordinate is not occupied' do
      result = game.square_occupied?(2, 3)
      expect(result).to eq false
    end
  end
end