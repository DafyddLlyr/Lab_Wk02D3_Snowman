require("minitest/autorun")
require("minitest/rg")
require_relative("../hiddenword")
require_relative("../game")
require_relative("../player")

class HiddenWordTest < MiniTest::Test

  def setup
    @player = Player.new("Dafydd")
    @hiddenword_1 = HiddenWord.new("codeclan")
    @hiddenword_2 = HiddenWord.new("code clan")
    @hiddenword_3 = HiddenWord.new("code clan!")
    @game = Game.new(@player, @hiddenword_2)
  end

  def test_word
    assert_equal("codeclan", @hiddenword_1.word)
  end

  def test_display__one_word
    assert_equal("********", @hiddenword_1.display(@game))
  end

  def test_display__two_words
    assert_equal("**** ****", @hiddenword_2.display(@game))
  end

  def test_display__non_alphabet
    assert_equal("**** ****!", @hiddenword_3.display(@game))
  end

  def test_include__true
    assert_equal(true, @hiddenword_1.include?("c"))
  end

  def test_include__false
    assert_equal(false, @hiddenword_1.include?("q"))
  end

end
