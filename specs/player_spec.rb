require("minitest/autorun")
require("minitest/rg")
require_relative("../player")

class PlayerTest < MiniTest::Test

  def setup
    @player = Player.new("Dafydd")
  end

  def test_name
    assert_equal("Dafydd", @player.name)
  end

  def test_lives
    assert_equal(6, @player.lives)
  end

end
