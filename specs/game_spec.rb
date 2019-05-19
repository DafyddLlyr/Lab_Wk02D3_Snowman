require("minitest/autorun")
require("minitest/rg")
require_relative("../game")
require_relative("../player")
require_relative("../hiddenword")
require("pry")

class GameTest < MiniTest::Test

  def setup
    @player = Player.new("Dafydd")
    @hiddenword = HiddenWord.new("code clan")
    @game = Game.new(@player, @hiddenword)
  end

  def test_player
    assert_equal(@player, @game.player)
  end

  def test_hiddenword
    assert_equal(@hiddenword, @game.hiddenword)
  end

  def test_guess__true
    @game.guess("c")
    assert_equal(6, @player.lives)
    assert_equal(true, @game.guessed_letters.include?("c"))
    assert_equal("c*** c***", @hiddenword.display(@game))
  end

  def test_guess__false
    @game.guess("q")
    assert_equal(5, @player.lives)
    assert_equal(false, @game.guessed_letters.include?("q"))
    assert_equal("**** ****", @hiddenword.display(@game))
  end

  def test_is_won?
    @game.guess("c")
    @game.guess("o")
    @game.guess("d")
    @game.guess("e")
    @game.guess("l")
    @game.guess("a")
    @game.guess("n")
    assert_equal(true, @game.is_won?)
    assert_equal("code clan", @hiddenword.display(@game))
  end

  def test_is_lost?
    @game.guess("q")
    @game.guess("z")
    @game.guess("x")
    @game.guess("j")
    @game.guess("k")
    @game.guess("v")
    assert_equal(true, @game.is_lost?)
    assert_equal(0, @player.lives)
  end

end
