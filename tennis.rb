module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    
    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      winner.record_won_ball!
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # when score > 3 checks to see if advantage, duece, or win
    def special_score 
      #player points - opponent points ==1  
      if @points == opponent.points  
        'deuce'
      elsif @points > 3 && @points - opponent.points == 1
        'advantage'
      elsif @points - opponent.points == 2
        'win'          
      else 
        'forty'
      end  
    end

    # Returns the String score for the player.
    def score
       if @points - opponent.points < 2
        case
        when @points == 0
          'love'
        when @points == 1
          'fifteen'
        when @points == 2
          'thirty'
        when @points >= 3
           special_score || 'forty' 
        end
      else
        'win'
      end
    end
  end
end