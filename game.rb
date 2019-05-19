class Game

  attr_reader :player, :hiddenword, :guessed_letters

  def initialize(player, hiddenword)
    @player = player
    @hiddenword = hiddenword
    @guessed_letters = []
  end

  def guess(letter)
    @hiddenword.include?(letter) ?
      @guessed_letters.push(letter) : @player.lives -= 1
  end

  def is_won?
    return @hiddenword.word == @hiddenword.display(self)
  end

  def is_lost?
    return @player.lives == 0
  end

end
