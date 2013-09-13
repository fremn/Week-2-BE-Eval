require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end
    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to eq(game.player2)
    end

  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)

      expect(game.player1.points).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
         player.points = 2
        player.opponent.points = 1

        expect(player.score).to eq('thirty')
      end  
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3
        player.opponent.points = 2

        expect(player.score).to eq('forty') 
      end  
    end

    context 'when points equal to opponents and is 3 or more' do
      it 'returns duece' do
        player.points = 4
        player.opponent.points = 4

        expect(player.score).to eq('deuce') 
      end
    end
    context 'when points is 1 greater than opponents and is 3 or more' do
      it 'returns advantage' do
        player.points = 5
        player.opponent.points = 4

        expect(player.score).to eq('advantage') 
      end
    end
    context 'when points is 2 greater than opponents' do
      it 'returns win ' do
        player.points = 6
        player.opponent.points = 4

        expect(player.score).to eq('win') 
      end
      it 'returns win ' do
        player.points = 2
        player.opponent.points = 0

        expect(player.score).to eq('win') 
      end
    end
  end
end