class HiddenWord

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def display(game)
    result = word.split("")
    alphabet = ("a".."z").to_a + ("A".."Z").to_a
    result.map! do |letter|
      game.guessed_letters.include?(letter) || !alphabet.include?(letter) ? letter : "*"
    end
    return result.join
  end

  def include?(letter)
    return @word.include?(letter)
  end

end
