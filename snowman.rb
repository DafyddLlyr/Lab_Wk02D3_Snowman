require_relative("./game")
require_relative("./hiddenword")
require_relative("./player")

p "-- Please enter the secret word: "
word = gets.chomp.downcase
@hiddenword = HiddenWord.new(word)
puts

system("clear")

p "-- Please enter your name: "
player_name = gets.chomp
@player = Player.new(player_name)
puts

@game = Game.new(@player, @hiddenword)

until @game.is_won? || @game.is_lost?
  p "-- Please guess a letter: "
  letter = gets.chomp
  @game.guess(letter)
  puts
  if @hiddenword.include?(letter)
    p "Correct! The word is currently: #{@hiddenword.display(@game)}"
    puts
  else
    p "You lost a life...! The word is currently: #{@hiddenword.display(@game)}"
    puts
  end
  p "#{@player.name} has #{@player.lives} lives remaining"
  puts
end

if @game.is_won?
  p "Congratualtions! You win!"
else
  p "You lose! Better luck next time"
end
