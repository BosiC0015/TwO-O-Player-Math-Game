require_relative './player'
require_relative './question'

class Game

  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player2, @player1]
    @turn = 1
  end

  def new_turn
    puts '----- NEW TURN -----'
    @turn += 1
    @players.rotate!
  end

  def get_question_for(p)
    q = Question.new
    puts "#{p.name}: #{q.question}"
    @res = q.answer
  end

  def get_player_to_answer
    @players.first
  end

  def output_scores
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def answer_the_question(p)
    input = gets.chomp
      if input.to_i == @res
        puts "#{p.name}: YES! you are correct."
      else
        puts "#{p.name}: Seriously? No!"
        p.wrong_answer
      end
    output_scores
  end

  def game_over
    @players.select {|player| player.lose?}.count > 0
  end

  def game_result(pl)
    puts "#{pl.name} wins with a score of #{pl.lives}/3"
  end

  def get_winner
    puts "get winner: player with lives > 0"
    @players.each do |player|
      if player.lives > 0
        return player
      end
    end
  end

  def game_end
    puts '----- GAME OVER -----'
    puts 'Goodbye!'
  end

  def play
    puts 'Game Start'

    until game_over do
      new_turn
      player = get_player_to_answer
      question = get_question_for(player)

      answer_the_question(player)
    end
    
    winner = get_winner
    game_result(winner)
    game_end

  end

end

game = Game.new
game.play