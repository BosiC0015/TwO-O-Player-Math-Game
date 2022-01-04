class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def wrong_answer
    self.lives -= 1
  end

  def lose?
    @lives == 0
  end

end