module Tennis
  class Game
    attr_accessor :player1, :player2

    #creates 2 players and sets each to be the others opponent
    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end
    #allows the game to be played
    def serve
      rosencrantz = rand(10)
      guildenstern = rand(10)
      rosencrantz > guildenstern ? wins_ball(@player1) : wins_ball(@player2)
    end
    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      winner.record_won_ball!
      puts "#{winner.to_s} won the serve!" 
    end
  end

  class Player
    attr_accessor :points, :opponent, :name

    def initialize
      @points = 0
    rand(2) == 1 ? @name = 'rosencrantz' : @name = 'guildenstern'
      
    end

    def to_s
      @name
    end
    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
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
          special_score
        end
      else
        'win'
      end
    end

    private
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
  end
end