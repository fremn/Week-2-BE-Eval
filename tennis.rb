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
    
    #Assigns one of the players as the winner based on random number
    def serve
      front = rand(10)
      back = rand(10)
      back > front ? wins_ball(@player1) : wins_ball(@player2)
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns Who won the serve and the score of the winning player. 
    def wins_ball(winner) # =>
      winner.record_won_ball! 
      "#{winner.to_s} won the serve! Their score is #{winner.score}"
    end
  end

  class Player
    attr_accessor :points, :opponent, :name

    def initialize
      @points = 0
      #names the player either 'rosencrantz' or 'guildenstern'
      rand(2) == 1 ? @name = 'rosencrantz' : @name = 'guildenstern'
      
    end
    # returns Player name
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
    #
    # Example given player1 is a Player with 1 point
    #   player1.score
    #   # => fifteen
    # See special_score method for more
    def score
      if @points - opponent.points <= 1
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

    # when a player's points > 3 checks to see if advantage, deuce, or win
    #
    def special_score 
      #player points - opponent points == 1  
      if @points - opponent.points == 0
        'deuce'
      elsif @points > 3 && @points - opponent.points == 1
        'advantage'
      elsif @points - opponent.points == 2
        'win'          
      else 
        'forty'
      end  
    end
    # def points_less_opponents
    #   @points_less_opponents = @points - opponent.points
    # end
  end
end